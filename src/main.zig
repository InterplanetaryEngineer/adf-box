const std = @import("std");
const base = @import("base.zig");
const c = base.c;
const vk = base.vk;
const vez = base.vez;
const convert = base.convert;
const roundUp = base.roundUp;
const VulkanError = base.VulkanError;
const stdout = std.io.getStdOut().outStream();

const mat = @import("zalgebra");
const mat4 = mat.mat4;
const vec = mat.vec3;

const model = @import("model.zig");

const Vertex = struct {
    x: f32,
    y: f32,
    z: f32,
    nx: f32,
    ny: f32,
    nz: f32,
    u: f32,
    v: f32,
};

//[4][4]f32;

var id = mat4.identity(); // [4][4]f32{
//     .{ 1, 0, 0, 0 },
//     .{ 0, 1, 0, 0 },
//     .{ 0, 0, 1, 0 },
//     .{ 0, 0, 0, 1 },
// };

const UniformBuffer = struct {
    model: mat4,
    view: mat4,
    projection: mat4,
};

fn bytewiseCopy(comptime T: type, data: []const T, dest: [*]u8) void {
    for (@ptrCast([*]const u8, data.ptr)[0..(data.len * @sizeOf(T))]) |byte, i| {
        dest[i] = byte;
    }
}

const Buffer = struct {
    handle: vk.Buffer,
    memory: vk.DeviceMemory,
    size: usize,

    fn init(self: *@This(), device: vk.Device, usage: vk.BufferUsageFlags, size: usize) VulkanError!void {
        // Create the device side buffer.
        var bufferCreateInfo = vez.BufferCreateInfo{
            .size = size,
            .usage = @intCast(u32, vk.BUFFER_USAGE_TRANSFER_DST_BIT) | usage,
        };
        try convert(vez.createBuffer(base.getDevice(), vez.MEMORY_NO_ALLOCATION, &bufferCreateInfo, &self.handle));
        // Allocate memory for the buffer.
        var memRequirements: vk.MemoryRequirements = undefined;
        vk.getBufferMemoryRequirements(base.getDevice(), self.handle, &memRequirements);

        self.size = memRequirements.size;
        var allocInfo = vk.MemoryAllocateInfo{
            .allocationSize = memRequirements.size,
            .memoryTypeIndex = findMemoryType(base.getPhysicalDevice(), memRequirements.memoryTypeBits, vk.MEMORY_PROPERTY_HOST_VISIBLE_BIT | vk.MEMORY_PROPERTY_HOST_COHERENT_BIT),
        };

        try convert(vk.allocateMemory(base.getDevice(), &allocInfo, null, &self.memory));

        // Bind the memory to the buffer.
        try convert(vk.bindBufferMemory(base.getDevice(), self.handle, self.memory, 0));
    }

    fn load(self: @This(), comptime T: type, data: []const T) !void {
        std.debug.assert(data.len * @sizeOf(T) <= self.size);
        var pData: [*]u8 = undefined;
        try convert(vk.mapMemory(base.getDevice(), self.memory, 0, self.size, 0, @ptrCast(*?*c_void, &pData)));
        bytewiseCopy(T, data, pData);
        vk.unmapMemory(base.getDevice(), self.memory);
    }
    fn deinit(self: @This(), device: vk.Device) void {
        vez.destroyBuffer(device, self.handle);
        vk.freeMemory(device, self.memory, null);
    }
};

const PipelineDesc = struct {
    pipeline: vez.Pipeline = null,
    shaderModules: []vk.ShaderModule,
};

const Image = struct {
    texture: vk.Image = null,
    view: vk.ImageView = null,
    sampler: vk.Sampler = null,
    width: u32 = 0,
    height: u32 = 0,

    pub fn init(self: *@This(), createInfo: vez.ImageCreateInfo, filter: vk.Filter, addressMode: vk.SamplerAddressMode) VulkanError!void {
        self.width = createInfo.extent.width;
        self.height = createInfo.extent.height;
        try convert(vez.createImage(base.getDevice(), vez.MEMORY_GPU_ONLY, &createInfo, &self.texture));

        // Create the image view for binding the texture as a resource.
        var imageViewCreateInfo = vez.ImageViewCreateInfo{
            .image = self.texture,
            .viewType = .IMAGE_VIEW_TYPE_2D,
            .format = createInfo.format,
            .subresourceRange = .{ .layerCount = 1, .levelCount = 1, .baseMipLevel = 0, .baseArrayLayer = 0 }, // defaults
        };
        try convert(vez.createImageView(base.getDevice(), &imageViewCreateInfo, &self.view));

        const samplerInfo = vez.SamplerCreateInfo{
            .magFilter = filter, // default?
            .minFilter = filter, // default?
            .mipmapMode = .SAMPLER_MIPMAP_MODE_LINEAR, // default?
            .addressModeU = addressMode, // default?
            .addressModeV = addressMode, // default?
            .addressModeW = addressMode, // default?
            .unnormalizedCoordinates = 0,
        };
        try convert(vez.createSampler(base.getDevice(), &samplerInfo, &self.sampler));
    }

    fn cmdBind(self: @This(), set: u32, binding: u32) void {
        vez.cmdBindImageView(renderTexture.view, renderTexture.sampler, set, binding, 0);
    }

    fn deinit(self: @This(), device: vk.Device) void {
        vez.destroyImageView(device, self.view);
        vez.destroyImage(device, self.texture);
        vez.destroySampler(device, self.sampler);
    }
};

var graphicsQueue: vk.Queue = null;
var vertexBuffer = Buffer{ .handle = null, .memory = null, .size = 0 };
var indexBuffer = Buffer{ .handle = null, .memory = null, .size = 0 };
var renderTexture: Image = Image{};
var values: Image = Image{};
var octData: Buffer = Buffer{ .handle = null, .memory = null, .size = 0 };
var uniformBuffer: vk.Buffer = null;
var drawPipeline: PipelineDesc = undefined;
var computePipeline: PipelineDesc = undefined;
var commandBuffer: vk.CommandBuffer = null;
var customCallback: vk.DebugUtilsMessengerEXT = null;

const allocator = std.heap.c_allocator;

export fn debugCallback(
    severity: vk.DebugUtilsMessageSeverityFlagBitsEXT,
    msgType: vk.DebugUtilsMessageTypeFlagsEXT,
    data: [*c]const vk.DebugUtilsMessengerCallbackDataEXT,
    userData: ?*c_void,
) vk.Bool32 {
    stdout.print("wowz: {}", .{data.*.pMessage}) catch unreachable;
    return 0;
}

fn findMemoryType(physicalDevice: vk.PhysicalDevice, typeFilter: u32, properties: vk.MemoryPropertyFlags) u32 {
    var memProperties: vk.PhysicalDeviceMemoryProperties = undefined;
    vk.getPhysicalDeviceMemoryProperties(physicalDevice, &memProperties);
    var i: u5 = 0;
    const mask: u32 = 1;
    while (i < memProperties.memoryTypeCount) : (i += 1) {
        if (typeFilter & (mask << i) != 0 and (memProperties.memoryTypes[i].propertyFlags & properties) == properties)
            return i;
    }

    return 0;
}

pub fn main() anyerror!void {
    try base.run(allocator, .{
        .name = "V-EZ-Test",
        .initialize = initialize,
        .cleanup = cleanup,
        .draw = draw,
        .onResize = onResize,
        .update = update,
    });
}

fn initialize() !void {
    const callbackCreateInfo = vk.DebugUtilsMessengerCreateInfoEXT{
        .sType = .DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT,
        .flags = 0,
        .messageSeverity = vk.DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT,
        .messageType = vk.DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT,
        .pfnUserCallback = debugCallback,
        .pUserData = null,
    };
    // TODO: Register the callback (currently throws linker error)
    // try convert(vk.createDebugUtilsMessengerEXT(base.getInstance(), &callbackCreateInfo, null, &customCallback));
    try createQuad();
    try createRenderTexture();
    try createModel();
    try createUniformBuffer();
    try createPipeline();
    try createCommandBuffer();
}

fn cleanup() !void {
    var device = base.getDevice();
    vertexBuffer.deinit(device);
    indexBuffer.deinit(device);
    renderTexture.deinit(device);
    values.deinit(device);
    octData.deinit(device);
    vez.destroyBuffer(device, uniformBuffer);

    vez.destroyPipeline(device, drawPipeline.pipeline);
    for (drawPipeline.shaderModules) |shaderModule| {
        vez.destroyShaderModule(device, shaderModule);
    }
    vez.destroyPipeline(device, computePipeline.pipeline);
    for (computePipeline.shaderModules) |shaderModule| {
        vez.destroyShaderModule(device, shaderModule);
    }

    vez.freeCommandBuffers(device, 1, &commandBuffer);
}

fn draw() !void {
    // Request a wait semaphore to pass to present so it waits for rendering to complete.
    var semaphore: vk.Semaphore = null;

    const submitInfo = vez.SubmitInfo{
        .waitSemaphoreCount = 0, // default
        .pWaitSemaphores = null, // default
        .pWaitDstStageMask = null, // default
        .commandBufferCount = 1,
        .pCommandBuffers = &commandBuffer,
        .signalSemaphoreCount = 1,
        .pSignalSemaphores = &semaphore,
    };
    try convert(vez.queueSubmit(graphicsQueue, 1, &submitInfo, null));

    // Present the swapchain framebuffer to the window.
    const waitDstStageMask = @intCast(u32, vk.PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT); //VkPipelineStageFlags
    const swapchain = base.getSwapchain();
    const srcImage = base.getColorAttachment();

    const presentInfo = vez.PresentInfo{
        .signalSemaphoreCount = 0, // default
        .pSignalSemaphores = null, // default
        .pResults = null, // default

        .waitSemaphoreCount = 1,
        .pWaitSemaphores = &semaphore,
        .pWaitDstStageMask = &waitDstStageMask,
        .swapchainCount = 1,
        .pSwapchains = &swapchain,
        .pImages = &srcImage,
    };
    try convert(vez.queuePresent(graphicsQueue, &presentInfo)) catch |err| switch (err) {
        VulkanError.Suboptimal => {}, // hmmst
        else => err,
    };
}

fn onResize(width: u32, height: u32) !void {
    renderTexture.deinit(base.getDevice());
    try createRenderTexture();
    vez.freeCommandBuffers(base.getDevice(), 1, &commandBuffer);
    try createCommandBuffer();
}

var runtime: f32 = 0;
fn update(deltaTime: f32) !void {
    var size = base.getWindowSize();
    runtime += deltaTime;
    // Calculate appropriate matrices for the current frame.
    var ub = UniformBuffer{
        .model = mat4.rotate(id, runtime * 10, vec.forward()),
        .view = mat.look_at(vec.new(2, 2, 2), vec.new(0, 0, 0), vec.forward()),
        .projection = mat.perspective(45, @intToFloat(f32, size[0]) / @intToFloat(f32, size[1]), 0.1, 10), //glm::perspective(glm::radians(45.0f), width / static_cast<float>(height), 0.1f, 10.0f),
    };
    ub.projection.data[1][1] *= -1;

    var data: *UniformBuffer = undefined;
    try convert(vez.mapBuffer(base.getDevice(), uniformBuffer, 0, @sizeOf(UniformBuffer), @ptrCast(*?*c_void, &data)));
    data.* = ub;
    vez.unmapBuffer(base.getDevice(), uniformBuffer);
}

fn createQuad() VulkanError!void {
    // A single quad with positions, normals and uvs.
    var vertices = [_]Vertex{
        .{ .x = -1, .y = -1, .z = 0, .nx = 0, .ny = 0, .nz = 1, .u = 0, .v = 0 },
        .{ .x = 1, .y = -1, .z = 0, .nx = 0, .ny = 0, .nz = 1, .u = 1, .v = 0 },
        .{ .x = 1, .y = 1, .z = 0, .nx = 0, .ny = 0, .nz = 1, .u = 1, .v = 1 },
        .{ .x = -1, .y = 1, .z = 0, .nx = 0, .ny = 0, .nz = 1, .u = 0, .v = 1 },
    };

    try vertexBuffer.init(base.getDevice(), vk.BUFFER_USAGE_VERTEX_BUFFER_BIT, @sizeOf(@TypeOf(vertices)));
    try vertexBuffer.load(Vertex, &vertices);

    const indices = [_]u32{
        0, 1, 2,
        0, 2, 3,
    };

    try indexBuffer.init(base.getDevice(), vk.BUFFER_USAGE_INDEX_BUFFER_BIT, @sizeOf(@TypeOf(indices)));
    try indexBuffer.load(u32, &indices);
}

fn createRenderTexture() !void {
    var extent = base.getWindowSize();
    const channels: u32 = 4;

    // Create the base.GetDevice() side image.
    var imageCreateInfo = vez.ImageCreateInfo{
        .format = .FORMAT_R8G8B8A8_UNORM,
        .extent = .{ .width = extent[0], .height = extent[1], .depth = 1 },
        .usage = vk.IMAGE_USAGE_TRANSFER_DST_BIT | vk.IMAGE_USAGE_SAMPLED_BIT | vk.IMAGE_USAGE_STORAGE_BIT,
    };
    try renderTexture.init(imageCreateInfo, .FILTER_LINEAR, .SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE);
}

fn createModel() !void {
    const valuesWidth = 32;

    var data = try model.load(allocator, valuesWidth);
    defer data.deinit(allocator);

    // Create the base.GetDevice() side image.
    var imageCreateInfo = vez.ImageCreateInfo{
        .format = .FORMAT_R8_UNORM,
        .extent = .{ .width = data.width, .height = data.height, .depth = 1 },
        .usage = vk.IMAGE_USAGE_TRANSFER_DST_BIT | vk.IMAGE_USAGE_SAMPLED_BIT,
    };
    try values.init(imageCreateInfo, .FILTER_LINEAR, .SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE);

    var subDataInfo = vez.ImageSubDataInfo{
        .imageExtent = .{ .width = data.width, .height = data.height, .depth = 1 },
    };
    try convert(vez.vezImageSubData(base.getDevice(), values.texture, &subDataInfo, data.values.ptr));

    try octData.init(base.getDevice(), vk.BUFFER_USAGE_STORAGE_BUFFER_BIT, data.tree.len * @sizeOf(i32) * 2);
    try octData.load([2]i32, data.tree);
}

fn createUniformBuffer() VulkanError!void {
    const createInfo = vez.BufferCreateInfo{
        .size = @sizeOf(UniformBuffer),
        .usage = vk.BUFFER_USAGE_TRANSFER_DST_BIT | vk.BUFFER_USAGE_UNIFORM_BUFFER_BIT,
    };
    try convert(vez.createBuffer(base.getDevice(), vez.MEMORY_CPU_TO_GPU, &createInfo, &uniformBuffer));
}

fn createPipeline() !void {
    drawPipeline = PipelineDesc{
        .shaderModules = try allocator.alloc(vk.ShaderModule, 2),
    };
    try base.createPipeline(allocator, &[_]base.PipelineShaderInfo{
        .{ .filename = "SimpleQuad.vert", .stage = .SHADER_STAGE_VERTEX_BIT },
        .{ .filename = "SimpleQuad.frag", .stage = .SHADER_STAGE_FRAGMENT_BIT },
    }, &drawPipeline.pipeline, drawPipeline.shaderModules);

    computePipeline = PipelineDesc{
        .shaderModules = try allocator.alloc(vk.ShaderModule, 1),
    };
    try base.createPipeline(allocator, &[_]base.PipelineShaderInfo{
        .{ .filename = "SimpleQuad.comp", .stage = .SHADER_STAGE_COMPUTE_BIT },
    }, &computePipeline.pipeline, computePipeline.shaderModules);
}

fn createCommandBuffer() !void {
    vez.getDeviceGraphicsQueue(base.getDevice(), 0, &graphicsQueue);

    try convert(vez.allocateCommandBuffers(base.getDevice(), &vez.CommandBufferAllocateInfo{
        .queue = graphicsQueue,
        .commandBufferCount = 1,
    }, &commandBuffer));

    // Command buffer recording
    try convert(vez.beginCommandBuffer(commandBuffer, vk.COMMAND_BUFFER_USAGE_SIMULTANEOUS_USE_BIT));

    vez.cmdBindPipeline(computePipeline.pipeline);
    vez.cmdBindBuffer(uniformBuffer, 0, vk.WHOLE_SIZE, 0, 0, 0);
    renderTexture.cmdBind(0, 3);
    const extents = base.getWindowSize();
    const groupSize = 32;
    vez.cmdDispatch(roundUp(extents[0], groupSize), roundUp(extents[1], groupSize), 1);

    base.cmdSetFullViewport();
    vez.cmdSetViewportState(1);

    // Define clear values for the swapchain's color and depth attachments.
    var attachmentReferences = [2]vez.AttachmentReference{
        .{
            .clearValue = .{ .color = .{ .float32 = .{ 0.3, 0.3, 0.3, 0.0 } } },
            .loadOp = .ATTACHMENT_LOAD_OP_CLEAR, // default?
        },
        .{
            .clearValue = .{ .depthStencil = .{ .depth = 1.0, .stencil = 0 } },
            .loadOp = .ATTACHMENT_LOAD_OP_CLEAR, // default?
        },
    };

    const beginInfo = vez.RenderPassBeginInfo{
        .framebuffer = base.getFramebuffer(),
        .attachmentCount = @intCast(u32, attachmentReferences.len),
        .pAttachments = &attachmentReferences,
    };
    vez.cmdBeginRenderPass(&beginInfo);

    // Bind the pipeline and associated resources.
    vez.cmdBindPipeline(drawPipeline.pipeline);
    vez.cmdBindBuffer(uniformBuffer, 0, vk.WHOLE_SIZE, 0, 0, 0);
    renderTexture.cmdBind(0, 1);

    // Set push constants.
    //float blendColor[3] = { 1.0f, 1.0f, 1.0f };
    //vezCmdPushConstants(0, sizeof(float) * 3, &blendColor[0]);

    // Set depth stencil state.
    const depthStencilState = vez.PipelineDepthStencilState{
        .depthBoundsTestEnable = 0,
        .stencilTestEnable = 0,
        .depthCompareOp = .COMPARE_OP_LESS_OR_EQUAL,
        .depthTestEnable = vk.TRUE,
        .depthWriteEnable = vk.TRUE,
        .front = .{
            .failOp = .STENCIL_OP_KEEP,
            .passOp = .STENCIL_OP_KEEP,
            .depthFailOp = .STENCIL_OP_KEEP,
        }, //  default?
        .back = .{
            .failOp = .STENCIL_OP_KEEP,
            .passOp = .STENCIL_OP_KEEP,
            .depthFailOp = .STENCIL_OP_KEEP,
        }, // default?
    };
    vez.cmdSetDepthStencilState(&depthStencilState);

    // Bind the vertex buffer and index buffers.
    vez.cmdBindVertexBuffers(0, 1, &[_]vk.Buffer{vertexBuffer.handle}, &[_]u64{0});
    vez.cmdBindIndexBuffer(indexBuffer.handle, 0, .INDEX_TYPE_UINT32);

    // Draw the quad.
    vez.cmdDrawIndexed(6, 1, 0, 0, 0);

    vez.cmdEndRenderPass();

    try convert(vez.endCommandBuffer());
}
