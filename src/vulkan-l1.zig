const vk = @import("vulkan.zig");

// TODO:
// - generate wrapers to convert
// \b([a-z])([a-zA-Z]*)Count: u32, p\u\2s: \[\*c\]
// to
// \1\2s: []
//
// - remove common enum suffixes

pub const createInstance = vk.vkCreateInstance;
pub const destroyInstance = vk.vkDestroyInstance;
pub const enumeratePhysicalDevices = vk.vkEnumeratePhysicalDevices;
pub const getPhysicalDeviceFeatures = vk.vkGetPhysicalDeviceFeatures;
pub const getPhysicalDeviceFormatProperties = vk.vkGetPhysicalDeviceFormatProperties;
pub const getPhysicalDeviceImageFormatProperties = vk.vkGetPhysicalDeviceImageFormatProperties;
pub const getPhysicalDeviceProperties = vk.vkGetPhysicalDeviceProperties;
pub const getPhysicalDeviceQueueFamilyProperties = vk.vkGetPhysicalDeviceQueueFamilyProperties;
pub const getPhysicalDeviceMemoryProperties = vk.vkGetPhysicalDeviceMemoryProperties;
pub const getInstanceProcAddr = vk.vkGetInstanceProcAddr;
pub const getDeviceProcAddr = vk.vkGetDeviceProcAddr;
pub const createDevice = vk.vkCreateDevice;
pub const destroyDevice = vk.vkDestroyDevice;
pub const enumerateInstanceExtensionProperties = vk.vkEnumerateInstanceExtensionProperties;
pub const enumerateDeviceExtensionProperties = vk.vkEnumerateDeviceExtensionProperties;
pub const enumerateInstanceLayerProperties = vk.vkEnumerateInstanceLayerProperties;
pub const enumerateDeviceLayerProperties = vk.vkEnumerateDeviceLayerProperties;
pub const getDeviceQueue = vk.vkGetDeviceQueue;
pub const queueSubmit = vk.vkQueueSubmit;
pub const queueWaitIdle = vk.vkQueueWaitIdle;
pub const deviceWaitIdle = vk.vkDeviceWaitIdle;
pub const allocateMemory = vk.vkAllocateMemory;
pub const freeMemory = vk.vkFreeMemory;
pub const mapMemory = vk.vkMapMemory;
pub const unmapMemory = vk.vkUnmapMemory;
pub const flushMappedMemoryRanges = vk.vkFlushMappedMemoryRanges;
pub const invalidateMappedMemoryRanges = vk.vkInvalidateMappedMemoryRanges;
pub const getDeviceMemoryCommitment = vk.vkGetDeviceMemoryCommitment;
pub const bindBufferMemory = vk.vkBindBufferMemory;
pub const bindImageMemory = vk.vkBindImageMemory;
pub const getBufferMemoryRequirements = vk.vkGetBufferMemoryRequirements;
pub const getImageMemoryRequirements = vk.vkGetImageMemoryRequirements;
pub const getImageSparseMemoryRequirements = vk.vkGetImageSparseMemoryRequirements;
pub const getPhysicalDeviceSparseImageFormatProperties = vk.vkGetPhysicalDeviceSparseImageFormatProperties;
pub const queueBindSparse = vk.vkQueueBindSparse;
pub const createFence = vk.vkCreateFence;
pub const destroyFence = vk.vkDestroyFence;
pub const resetFences = vk.vkResetFences;
pub const getFenceStatus = vk.vkGetFenceStatus;
pub const waitForFences = vk.vkWaitForFences;
pub const createSemaphore = vk.vkCreateSemaphore;
pub const destroySemaphore = vk.vkDestroySemaphore;
pub const createEvent = vk.vkCreateEvent;
pub const destroyEvent = vk.vkDestroyEvent;
pub const getEventStatus = vk.vkGetEventStatus;
pub const setEvent = vk.vkSetEvent;
pub const resetEvent = vk.vkResetEvent;
pub const createQueryPool = vk.vkCreateQueryPool;
pub const destroyQueryPool = vk.vkDestroyQueryPool;
pub const getQueryPoolResults = vk.vkGetQueryPoolResults;
pub const createBuffer = vk.vkCreateBuffer;
pub const destroyBuffer = vk.vkDestroyBuffer;
pub const createBufferView = vk.vkCreateBufferView;
pub const destroyBufferView = vk.vkDestroyBufferView;
pub const createImage = vk.vkCreateImage;
pub const destroyImage = vk.vkDestroyImage;
pub const getImageSubresourceLayout = vk.vkGetImageSubresourceLayout;
pub const createImageView = vk.vkCreateImageView;
pub const destroyImageView = vk.vkDestroyImageView;
pub const createShaderModule = vk.vkCreateShaderModule;
pub const destroyShaderModule = vk.vkDestroyShaderModule;
pub const createPipelineCache = vk.vkCreatePipelineCache;
pub const destroyPipelineCache = vk.vkDestroyPipelineCache;
pub const getPipelineCacheData = vk.vkGetPipelineCacheData;
pub const mergePipelineCaches = vk.vkMergePipelineCaches;
pub const createGraphicsPipelines = vk.vkCreateGraphicsPipelines;
pub const createComputePipelines = vk.vkCreateComputePipelines;
pub const destroyPipeline = vk.vkDestroyPipeline;
pub const createPipelineLayout = vk.vkCreatePipelineLayout;
pub const destroyPipelineLayout = vk.vkDestroyPipelineLayout;
pub const createSampler = vk.vkCreateSampler;
pub const destroySampler = vk.vkDestroySampler;
pub const createDescriptorSetLayout = vk.vkCreateDescriptorSetLayout;
pub const destroyDescriptorSetLayout = vk.vkDestroyDescriptorSetLayout;
pub const createDescriptorPool = vk.vkCreateDescriptorPool;
pub const destroyDescriptorPool = vk.vkDestroyDescriptorPool;
pub const resetDescriptorPool = vk.vkResetDescriptorPool;
pub const allocateDescriptorSets = vk.vkAllocateDescriptorSets;
pub const freeDescriptorSets = vk.vkFreeDescriptorSets;
pub const updateDescriptorSets = vk.vkUpdateDescriptorSets;
pub const createFramebuffer = vk.vkCreateFramebuffer;
pub const destroyFramebuffer = vk.vkDestroyFramebuffer;
pub const createRenderPass = vk.vkCreateRenderPass;
pub const destroyRenderPass = vk.vkDestroyRenderPass;
pub const getRenderAreaGranularity = vk.vkGetRenderAreaGranularity;
pub const createCommandPool = vk.vkCreateCommandPool;
pub const destroyCommandPool = vk.vkDestroyCommandPool;
pub const resetCommandPool = vk.vkResetCommandPool;
pub const allocateCommandBuffers = vk.vkAllocateCommandBuffers;
pub const freeCommandBuffers = vk.vkFreeCommandBuffers;
pub const beginCommandBuffer = vk.vkBeginCommandBuffer;
pub const endCommandBuffer = vk.vkEndCommandBuffer;
pub const resetCommandBuffer = vk.vkResetCommandBuffer;
pub const cmdBindPipeline = vk.vkCmdBindPipeline;
pub const cmdSetViewport = vk.vkCmdSetViewport;
pub const cmdSetScissor = vk.vkCmdSetScissor;
pub const cmdSetLineWidth = vk.vkCmdSetLineWidth;
pub const cmdSetDepthBias = vk.vkCmdSetDepthBias;
pub const cmdSetBlendConstants = vk.vkCmdSetBlendConstants;
pub const cmdSetDepthBounds = vk.vkCmdSetDepthBounds;
pub const cmdSetStencilCompareMask = vk.vkCmdSetStencilCompareMask;
pub const cmdSetStencilWriteMask = vk.vkCmdSetStencilWriteMask;
pub const cmdSetStencilReference = vk.vkCmdSetStencilReference;
pub const cmdBindDescriptorSets = vk.vkCmdBindDescriptorSets;
pub const cmdBindIndexBuffer = vk.vkCmdBindIndexBuffer;
pub const cmdBindVertexBuffers = vk.vkCmdBindVertexBuffers;
pub const cmdDraw = vk.vkCmdDraw;
pub const cmdDrawIndexed = vk.vkCmdDrawIndexed;
pub const cmdDrawIndirect = vk.vkCmdDrawIndirect;
pub const cmdDrawIndexedIndirect = vk.vkCmdDrawIndexedIndirect;
pub const cmdDispatch = vk.vkCmdDispatch;
pub const cmdDispatchIndirect = vk.vkCmdDispatchIndirect;
pub const cmdCopyBuffer = vk.vkCmdCopyBuffer;
pub const cmdCopyImage = vk.vkCmdCopyImage;
pub const cmdBlitImage = vk.vkCmdBlitImage;
pub const cmdCopyBufferToImage = vk.vkCmdCopyBufferToImage;
pub const cmdCopyImageToBuffer = vk.vkCmdCopyImageToBuffer;
pub const cmdUpdateBuffer = vk.vkCmdUpdateBuffer;
pub const cmdFillBuffer = vk.vkCmdFillBuffer;
pub const cmdClearColorImage = vk.vkCmdClearColorImage;
pub const cmdClearDepthStencilImage = vk.vkCmdClearDepthStencilImage;
pub const cmdClearAttachments = vk.vkCmdClearAttachments;
pub const cmdResolveImage = vk.vkCmdResolveImage;
pub const cmdSetEvent = vk.vkCmdSetEvent;
pub const cmdResetEvent = vk.vkCmdResetEvent;
pub const cmdWaitEvents = vk.vkCmdWaitEvents;
pub const cmdPipelineBarrier = vk.vkCmdPipelineBarrier;
pub const cmdBeginQuery = vk.vkCmdBeginQuery;
pub const cmdEndQuery = vk.vkCmdEndQuery;
pub const cmdResetQueryPool = vk.vkCmdResetQueryPool;
pub const cmdWriteTimestamp = vk.vkCmdWriteTimestamp;
pub const cmdCopyQueryPoolResults = vk.vkCmdCopyQueryPoolResults;
pub const cmdPushConstants = vk.vkCmdPushConstants;
pub const cmdBeginRenderPass = vk.vkCmdBeginRenderPass;
pub const cmdNextSubpass = vk.vkCmdNextSubpass;
pub const cmdEndRenderPass = vk.vkCmdEndRenderPass;
pub const cmdExecuteCommands = vk.vkCmdExecuteCommands;
pub const enumerateInstanceVersion = vk.vkEnumerateInstanceVersion;
pub const bindBufferMemory2 = vk.vkBindBufferMemory2;
pub const bindImageMemory2 = vk.vkBindImageMemory2;
pub const getDeviceGroupPeerMemoryFeatures = vk.vkGetDeviceGroupPeerMemoryFeatures;
pub const cmdSetDeviceMask = vk.vkCmdSetDeviceMask;
pub const cmdDispatchBase = vk.vkCmdDispatchBase;
pub const enumeratePhysicalDeviceGroups = vk.vkEnumeratePhysicalDeviceGroups;
pub const getImageMemoryRequirements2 = vk.vkGetImageMemoryRequirements2;
pub const getBufferMemoryRequirements2 = vk.vkGetBufferMemoryRequirements2;
pub const getImageSparseMemoryRequirements2 = vk.vkGetImageSparseMemoryRequirements2;
pub const getPhysicalDeviceFeatures2 = vk.vkGetPhysicalDeviceFeatures2;
pub const getPhysicalDeviceProperties2 = vk.vkGetPhysicalDeviceProperties2;
pub const getPhysicalDeviceFormatProperties2 = vk.vkGetPhysicalDeviceFormatProperties2;
pub const getPhysicalDeviceImageFormatProperties2 = vk.vkGetPhysicalDeviceImageFormatProperties2;
pub const getPhysicalDeviceQueueFamilyProperties2 = vk.vkGetPhysicalDeviceQueueFamilyProperties2;
pub const getPhysicalDeviceMemoryProperties2 = vk.vkGetPhysicalDeviceMemoryProperties2;
pub const getPhysicalDeviceSparseImageFormatProperties2 = vk.vkGetPhysicalDeviceSparseImageFormatProperties2;
pub const trimCommandPool = vk.vkTrimCommandPool;
pub const getDeviceQueue2 = vk.vkGetDeviceQueue2;
pub const createSamplerYcbcrConversion = vk.vkCreateSamplerYcbcrConversion;
pub const destroySamplerYcbcrConversion = vk.vkDestroySamplerYcbcrConversion;
pub const createDescriptorUpdateTemplate = vk.vkCreateDescriptorUpdateTemplate;
pub const destroyDescriptorUpdateTemplate = vk.vkDestroyDescriptorUpdateTemplate;
pub const updateDescriptorSetWithTemplate = vk.vkUpdateDescriptorSetWithTemplate;
pub const getPhysicalDeviceExternalBufferProperties = vk.vkGetPhysicalDeviceExternalBufferProperties;
pub const getPhysicalDeviceExternalFenceProperties = vk.vkGetPhysicalDeviceExternalFenceProperties;
pub const getPhysicalDeviceExternalSemaphoreProperties = vk.vkGetPhysicalDeviceExternalSemaphoreProperties;
pub const getDescriptorSetLayoutSupport = vk.vkGetDescriptorSetLayoutSupport;
pub const cmdDrawIndirectCount = vk.vkCmdDrawIndirectCount;
pub const cmdDrawIndexedIndirectCount = vk.vkCmdDrawIndexedIndirectCount;
pub const createRenderPass2 = vk.vkCreateRenderPass2;
pub const cmdBeginRenderPass2 = vk.vkCmdBeginRenderPass2;
pub const cmdNextSubpass2 = vk.vkCmdNextSubpass2;
pub const cmdEndRenderPass2 = vk.vkCmdEndRenderPass2;
pub const resetQueryPool = vk.vkResetQueryPool;
pub const getSemaphoreCounterValue = vk.vkGetSemaphoreCounterValue;
pub const waitSemaphores = vk.vkWaitSemaphores;
pub const signalSemaphore = vk.vkSignalSemaphore;
pub const getBufferDeviceAddress = vk.vkGetBufferDeviceAddress;
pub const getBufferOpaqueCaptureAddress = vk.vkGetBufferOpaqueCaptureAddress;
pub const getDeviceMemoryOpaqueCaptureAddress = vk.vkGetDeviceMemoryOpaqueCaptureAddress;
pub const destroySurfaceKHR = vk.vkDestroySurfaceKHR;
pub const getPhysicalDeviceSurfaceSupportKHR = vk.vkGetPhysicalDeviceSurfaceSupportKHR;
pub const getPhysicalDeviceSurfaceCapabilitiesKHR = vk.vkGetPhysicalDeviceSurfaceCapabilitiesKHR;
pub const getPhysicalDeviceSurfaceFormatsKHR = vk.vkGetPhysicalDeviceSurfaceFormatsKHR;
pub const getPhysicalDeviceSurfacePresentModesKHR = vk.vkGetPhysicalDeviceSurfacePresentModesKHR;
pub const createSwapchainKHR = vk.vkCreateSwapchainKHR;
pub const destroySwapchainKHR = vk.vkDestroySwapchainKHR;
pub const getSwapchainImagesKHR = vk.vkGetSwapchainImagesKHR;
pub const acquireNextImageKHR = vk.vkAcquireNextImageKHR;
pub const queuePresentKHR = vk.vkQueuePresentKHR;
pub const getDeviceGroupPresentCapabilitiesKHR = vk.vkGetDeviceGroupPresentCapabilitiesKHR;
pub const getDeviceGroupSurfacePresentModesKHR = vk.vkGetDeviceGroupSurfacePresentModesKHR;
pub const getPhysicalDevicePresentRectanglesKHR = vk.vkGetPhysicalDevicePresentRectanglesKHR;
pub const acquireNextImage2KHR = vk.vkAcquireNextImage2KHR;
pub const getPhysicalDeviceDisplayPropertiesKHR = vk.vkGetPhysicalDeviceDisplayPropertiesKHR;
pub const getPhysicalDeviceDisplayPlanePropertiesKHR = vk.vkGetPhysicalDeviceDisplayPlanePropertiesKHR;
pub const getDisplayPlaneSupportedDisplaysKHR = vk.vkGetDisplayPlaneSupportedDisplaysKHR;
pub const getDisplayModePropertiesKHR = vk.vkGetDisplayModePropertiesKHR;
pub const createDisplayModeKHR = vk.vkCreateDisplayModeKHR;
pub const getDisplayPlaneCapabilitiesKHR = vk.vkGetDisplayPlaneCapabilitiesKHR;
pub const createDisplayPlaneSurfaceKHR = vk.vkCreateDisplayPlaneSurfaceKHR;
pub const createSharedSwapchainsKHR = vk.vkCreateSharedSwapchainsKHR;
pub const getPhysicalDeviceFeatures2KHR = vk.vkGetPhysicalDeviceFeatures2KHR;
pub const getPhysicalDeviceProperties2KHR = vk.vkGetPhysicalDeviceProperties2KHR;
pub const getPhysicalDeviceFormatProperties2KHR = vk.vkGetPhysicalDeviceFormatProperties2KHR;
pub const getPhysicalDeviceImageFormatProperties2KHR = vk.vkGetPhysicalDeviceImageFormatProperties2KHR;
pub const getPhysicalDeviceQueueFamilyProperties2KHR = vk.vkGetPhysicalDeviceQueueFamilyProperties2KHR;
pub const getPhysicalDeviceMemoryProperties2KHR = vk.vkGetPhysicalDeviceMemoryProperties2KHR;
pub const getPhysicalDeviceSparseImageFormatProperties2KHR = vk.vkGetPhysicalDeviceSparseImageFormatProperties2KHR;
pub const getDeviceGroupPeerMemoryFeaturesKHR = vk.vkGetDeviceGroupPeerMemoryFeaturesKHR;
pub const cmdSetDeviceMaskKHR = vk.vkCmdSetDeviceMaskKHR;
pub const cmdDispatchBaseKHR = vk.vkCmdDispatchBaseKHR;
pub const trimCommandPoolKHR = vk.vkTrimCommandPoolKHR;
pub const enumeratePhysicalDeviceGroupsKHR = vk.vkEnumeratePhysicalDeviceGroupsKHR;
pub const getPhysicalDeviceExternalBufferPropertiesKHR = vk.vkGetPhysicalDeviceExternalBufferPropertiesKHR;
pub const getMemoryFdKHR = vk.vkGetMemoryFdKHR;
pub const getMemoryFdPropertiesKHR = vk.vkGetMemoryFdPropertiesKHR;
pub const getPhysicalDeviceExternalSemaphorePropertiesKHR = vk.vkGetPhysicalDeviceExternalSemaphorePropertiesKHR;
pub const importSemaphoreFdKHR = vk.vkImportSemaphoreFdKHR;
pub const getSemaphoreFdKHR = vk.vkGetSemaphoreFdKHR;
pub const cmdPushDescriptorSetKHR = vk.vkCmdPushDescriptorSetKHR;
pub const cmdPushDescriptorSetWithTemplateKHR = vk.vkCmdPushDescriptorSetWithTemplateKHR;
pub const createDescriptorUpdateTemplateKHR = vk.vkCreateDescriptorUpdateTemplateKHR;
pub const destroyDescriptorUpdateTemplateKHR = vk.vkDestroyDescriptorUpdateTemplateKHR;
pub const updateDescriptorSetWithTemplateKHR = vk.vkUpdateDescriptorSetWithTemplateKHR;
pub const createRenderPass2KHR = vk.vkCreateRenderPass2KHR;
pub const cmdBeginRenderPass2KHR = vk.vkCmdBeginRenderPass2KHR;
pub const cmdNextSubpass2KHR = vk.vkCmdNextSubpass2KHR;
pub const cmdEndRenderPass2KHR = vk.vkCmdEndRenderPass2KHR;
pub const getSwapchainStatusKHR = vk.vkGetSwapchainStatusKHR;
pub const getPhysicalDeviceExternalFencePropertiesKHR = vk.vkGetPhysicalDeviceExternalFencePropertiesKHR;
pub const importFenceFdKHR = vk.vkImportFenceFdKHR;
pub const getFenceFdKHR = vk.vkGetFenceFdKHR;
pub const enumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR = vk.vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR;
pub const getPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR = vk.vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR;
pub const acquireProfilingLockKHR = vk.vkAcquireProfilingLockKHR;
pub const releaseProfilingLockKHR = vk.vkReleaseProfilingLockKHR;
pub const getPhysicalDeviceSurfaceCapabilities2KHR = vk.vkGetPhysicalDeviceSurfaceCapabilities2KHR;
pub const getPhysicalDeviceSurfaceFormats2KHR = vk.vkGetPhysicalDeviceSurfaceFormats2KHR;
pub const getPhysicalDeviceDisplayProperties2KHR = vk.vkGetPhysicalDeviceDisplayProperties2KHR;
pub const getPhysicalDeviceDisplayPlaneProperties2KHR = vk.vkGetPhysicalDeviceDisplayPlaneProperties2KHR;
pub const getDisplayModeProperties2KHR = vk.vkGetDisplayModeProperties2KHR;
pub const getDisplayPlaneCapabilities2KHR = vk.vkGetDisplayPlaneCapabilities2KHR;
pub const getImageMemoryRequirements2KHR = vk.vkGetImageMemoryRequirements2KHR;
pub const getBufferMemoryRequirements2KHR = vk.vkGetBufferMemoryRequirements2KHR;
pub const getImageSparseMemoryRequirements2KHR = vk.vkGetImageSparseMemoryRequirements2KHR;
pub const createSamplerYcbcrConversionKHR = vk.vkCreateSamplerYcbcrConversionKHR;
pub const destroySamplerYcbcrConversionKHR = vk.vkDestroySamplerYcbcrConversionKHR;
pub const bindBufferMemory2KHR = vk.vkBindBufferMemory2KHR;
pub const bindImageMemory2KHR = vk.vkBindImageMemory2KHR;
pub const getDescriptorSetLayoutSupportKHR = vk.vkGetDescriptorSetLayoutSupportKHR;
pub const cmdDrawIndirectCountKHR = vk.vkCmdDrawIndirectCountKHR;
pub const cmdDrawIndexedIndirectCountKHR = vk.vkCmdDrawIndexedIndirectCountKHR;
pub const getSemaphoreCounterValueKHR = vk.vkGetSemaphoreCounterValueKHR;
pub const waitSemaphoresKHR = vk.vkWaitSemaphoresKHR;
pub const signalSemaphoreKHR = vk.vkSignalSemaphoreKHR;
pub const getPhysicalDeviceFragmentShadingRatesKHR = vk.vkGetPhysicalDeviceFragmentShadingRatesKHR;
pub const cmdSetFragmentShadingRateKHR = vk.vkCmdSetFragmentShadingRateKHR;
pub const getBufferDeviceAddressKHR = vk.vkGetBufferDeviceAddressKHR;
pub const getBufferOpaqueCaptureAddressKHR = vk.vkGetBufferOpaqueCaptureAddressKHR;
pub const getDeviceMemoryOpaqueCaptureAddressKHR = vk.vkGetDeviceMemoryOpaqueCaptureAddressKHR;
pub const getPipelineExecutablePropertiesKHR = vk.vkGetPipelineExecutablePropertiesKHR;
pub const getPipelineExecutableStatisticsKHR = vk.vkGetPipelineExecutableStatisticsKHR;
pub const getPipelineExecutableInternalRepresentationsKHR = vk.vkGetPipelineExecutableInternalRepresentationsKHR;
pub const cmdCopyBuffer2KHR = vk.vkCmdCopyBuffer2KHR;
pub const cmdCopyImage2KHR = vk.vkCmdCopyImage2KHR;
pub const cmdCopyBufferToImage2KHR = vk.vkCmdCopyBufferToImage2KHR;
pub const cmdCopyImageToBuffer2KHR = vk.vkCmdCopyImageToBuffer2KHR;
pub const cmdBlitImage2KHR = vk.vkCmdBlitImage2KHR;
pub const cmdResolveImage2KHR = vk.vkCmdResolveImage2KHR;
pub const createDebugReportCallbackEXT = vk.vkCreateDebugReportCallbackEXT;
pub const destroyDebugReportCallbackEXT = vk.vkDestroyDebugReportCallbackEXT;
pub const debugReportMessageEXT = vk.vkDebugReportMessageEXT;
pub const debugMarkerSetObjectTagEXT = vk.vkDebugMarkerSetObjectTagEXT;
pub const debugMarkerSetObjectNameEXT = vk.vkDebugMarkerSetObjectNameEXT;
pub const cmdDebugMarkerBeginEXT = vk.vkCmdDebugMarkerBeginEXT;
pub const cmdDebugMarkerEndEXT = vk.vkCmdDebugMarkerEndEXT;
pub const cmdDebugMarkerInsertEXT = vk.vkCmdDebugMarkerInsertEXT;
pub const cmdBindTransformFeedbackBuffersEXT = vk.vkCmdBindTransformFeedbackBuffersEXT;
pub const cmdBeginTransformFeedbackEXT = vk.vkCmdBeginTransformFeedbackEXT;
pub const cmdEndTransformFeedbackEXT = vk.vkCmdEndTransformFeedbackEXT;
pub const cmdBeginQueryIndexedEXT = vk.vkCmdBeginQueryIndexedEXT;
pub const cmdEndQueryIndexedEXT = vk.vkCmdEndQueryIndexedEXT;
pub const cmdDrawIndirectByteCountEXT = vk.vkCmdDrawIndirectByteCountEXT;
pub const getImageViewHandleNVX = vk.vkGetImageViewHandleNVX;
pub const getImageViewAddressNVX = vk.vkGetImageViewAddressNVX;
pub const cmdDrawIndirectCountAMD = vk.vkCmdDrawIndirectCountAMD;
pub const cmdDrawIndexedIndirectCountAMD = vk.vkCmdDrawIndexedIndirectCountAMD;
pub const getShaderInfoAMD = vk.vkGetShaderInfoAMD;
pub const getPhysicalDeviceExternalImageFormatPropertiesNV = vk.vkGetPhysicalDeviceExternalImageFormatPropertiesNV;
pub const cmdBeginConditionalRenderingEXT = vk.vkCmdBeginConditionalRenderingEXT;
pub const cmdEndConditionalRenderingEXT = vk.vkCmdEndConditionalRenderingEXT;
pub const cmdSetViewportWScalingNV = vk.vkCmdSetViewportWScalingNV;
pub const releaseDisplayEXT = vk.vkReleaseDisplayEXT;
pub const getPhysicalDeviceSurfaceCapabilities2EXT = vk.vkGetPhysicalDeviceSurfaceCapabilities2EXT;
pub const displayPowerControlEXT = vk.vkDisplayPowerControlEXT;
pub const registerDeviceEventEXT = vk.vkRegisterDeviceEventEXT;
pub const registerDisplayEventEXT = vk.vkRegisterDisplayEventEXT;
pub const getSwapchainCounterEXT = vk.vkGetSwapchainCounterEXT;
pub const getRefreshCycleDurationGOOGLE = vk.vkGetRefreshCycleDurationGOOGLE;
pub const getPastPresentationTimingGOOGLE = vk.vkGetPastPresentationTimingGOOGLE;
pub const cmdSetDiscardRectangleEXT = vk.vkCmdSetDiscardRectangleEXT;
pub const setHdrMetadataEXT = vk.vkSetHdrMetadataEXT;
pub const setDebugUtilsObjectNameEXT = vk.vkSetDebugUtilsObjectNameEXT;
pub const setDebugUtilsObjectTagEXT = vk.vkSetDebugUtilsObjectTagEXT;
pub const queueBeginDebugUtilsLabelEXT = vk.vkQueueBeginDebugUtilsLabelEXT;
pub const queueEndDebugUtilsLabelEXT = vk.vkQueueEndDebugUtilsLabelEXT;
pub const queueInsertDebugUtilsLabelEXT = vk.vkQueueInsertDebugUtilsLabelEXT;
pub const cmdBeginDebugUtilsLabelEXT = vk.vkCmdBeginDebugUtilsLabelEXT;
pub const cmdEndDebugUtilsLabelEXT = vk.vkCmdEndDebugUtilsLabelEXT;
pub const cmdInsertDebugUtilsLabelEXT = vk.vkCmdInsertDebugUtilsLabelEXT;
pub const createDebugUtilsMessengerEXT = vk.vkCreateDebugUtilsMessengerEXT;
pub const destroyDebugUtilsMessengerEXT = vk.vkDestroyDebugUtilsMessengerEXT;
pub const submitDebugUtilsMessageEXT = vk.vkSubmitDebugUtilsMessageEXT;
pub const cmdSetSampleLocationsEXT = vk.vkCmdSetSampleLocationsEXT;
pub const getPhysicalDeviceMultisamplePropertiesEXT = vk.vkGetPhysicalDeviceMultisamplePropertiesEXT;
pub const getImageDrmFormatModifierPropertiesEXT = vk.vkGetImageDrmFormatModifierPropertiesEXT;
pub const createValidationCacheEXT = vk.vkCreateValidationCacheEXT;
pub const destroyValidationCacheEXT = vk.vkDestroyValidationCacheEXT;
pub const mergeValidationCachesEXT = vk.vkMergeValidationCachesEXT;
pub const getValidationCacheDataEXT = vk.vkGetValidationCacheDataEXT;
pub const cmdBindShadingRateImageNV = vk.vkCmdBindShadingRateImageNV;
pub const cmdSetViewportShadingRatePaletteNV = vk.vkCmdSetViewportShadingRatePaletteNV;
pub const cmdSetCoarseSampleOrderNV = vk.vkCmdSetCoarseSampleOrderNV;
pub const createAccelerationStructureNV = vk.vkCreateAccelerationStructureNV;
pub const destroyAccelerationStructureKHR = vk.vkDestroyAccelerationStructureKHR;
pub const destroyAccelerationStructureNV = vk.vkDestroyAccelerationStructureNV;
pub const getAccelerationStructureMemoryRequirementsNV = vk.vkGetAccelerationStructureMemoryRequirementsNV;
pub const bindAccelerationStructureMemoryKHR = vk.vkBindAccelerationStructureMemoryKHR;
pub const bindAccelerationStructureMemoryNV = vk.vkBindAccelerationStructureMemoryNV;
pub const cmdBuildAccelerationStructureNV = vk.vkCmdBuildAccelerationStructureNV;
pub const cmdCopyAccelerationStructureNV = vk.vkCmdCopyAccelerationStructureNV;
pub const cmdTraceRaysNV = vk.vkCmdTraceRaysNV;
pub const createRayTracingPipelinesNV = vk.vkCreateRayTracingPipelinesNV;
pub const getRayTracingShaderGroupHandlesKHR = vk.vkGetRayTracingShaderGroupHandlesKHR;
pub const getRayTracingShaderGroupHandlesNV = vk.vkGetRayTracingShaderGroupHandlesNV;
pub const getAccelerationStructureHandleNV = vk.vkGetAccelerationStructureHandleNV;
pub const cmdWriteAccelerationStructuresPropertiesKHR = vk.vkCmdWriteAccelerationStructuresPropertiesKHR;
pub const cmdWriteAccelerationStructuresPropertiesNV = vk.vkCmdWriteAccelerationStructuresPropertiesNV;
pub const compileDeferredNV = vk.vkCompileDeferredNV;
pub const getMemoryHostPointerPropertiesEXT = vk.vkGetMemoryHostPointerPropertiesEXT;
pub const cmdWriteBufferMarkerAMD = vk.vkCmdWriteBufferMarkerAMD;
pub const getPhysicalDeviceCalibrateableTimeDomainsEXT = vk.vkGetPhysicalDeviceCalibrateableTimeDomainsEXT;
pub const getCalibratedTimestampsEXT = vk.vkGetCalibratedTimestampsEXT;
pub const cmdDrawMeshTasksNV = vk.vkCmdDrawMeshTasksNV;
pub const cmdDrawMeshTasksIndirectNV = vk.vkCmdDrawMeshTasksIndirectNV;
pub const cmdDrawMeshTasksIndirectCountNV = vk.vkCmdDrawMeshTasksIndirectCountNV;
pub const cmdSetExclusiveScissorNV = vk.vkCmdSetExclusiveScissorNV;
pub const cmdSetCheckpointNV = vk.vkCmdSetCheckpointNV;
pub const getQueueCheckpointDataNV = vk.vkGetQueueCheckpointDataNV;
pub const initializePerformanceApiINTEL = vk.vkInitializePerformanceApiINTEL;
pub const uninitializePerformanceApiINTEL = vk.vkUninitializePerformanceApiINTEL;
pub const cmdSetPerformanceMarkerINTEL = vk.vkCmdSetPerformanceMarkerINTEL;
pub const cmdSetPerformanceStreamMarkerINTEL = vk.vkCmdSetPerformanceStreamMarkerINTEL;
pub const cmdSetPerformanceOverrideINTEL = vk.vkCmdSetPerformanceOverrideINTEL;
pub const acquirePerformanceConfigurationINTEL = vk.vkAcquirePerformanceConfigurationINTEL;
pub const releasePerformanceConfigurationINTEL = vk.vkReleasePerformanceConfigurationINTEL;
pub const queueSetPerformanceConfigurationINTEL = vk.vkQueueSetPerformanceConfigurationINTEL;
pub const getPerformanceParameterINTEL = vk.vkGetPerformanceParameterINTEL;
pub const setLocalDimmingAMD = vk.vkSetLocalDimmingAMD;
pub const getBufferDeviceAddressEXT = vk.vkGetBufferDeviceAddressEXT;
pub const getPhysicalDeviceToolPropertiesEXT = vk.vkGetPhysicalDeviceToolPropertiesEXT;
pub const getPhysicalDeviceCooperativeMatrixPropertiesNV = vk.vkGetPhysicalDeviceCooperativeMatrixPropertiesNV;
pub const getPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV = vk.vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV;
pub const createHeadlessSurfaceEXT = vk.vkCreateHeadlessSurfaceEXT;
pub const cmdSetLineStippleEXT = vk.vkCmdSetLineStippleEXT;
pub const resetQueryPoolEXT = vk.vkResetQueryPoolEXT;
pub const cmdSetCullModeEXT = vk.vkCmdSetCullModeEXT;
pub const cmdSetFrontFaceEXT = vk.vkCmdSetFrontFaceEXT;
pub const cmdSetPrimitiveTopologyEXT = vk.vkCmdSetPrimitiveTopologyEXT;
pub const cmdSetViewportWithCountEXT = vk.vkCmdSetViewportWithCountEXT;
pub const cmdSetScissorWithCountEXT = vk.vkCmdSetScissorWithCountEXT;
pub const cmdBindVertexBuffers2EXT = vk.vkCmdBindVertexBuffers2EXT;
pub const cmdSetDepthTestEnableEXT = vk.vkCmdSetDepthTestEnableEXT;
pub const cmdSetDepthWriteEnableEXT = vk.vkCmdSetDepthWriteEnableEXT;
pub const cmdSetDepthCompareOpEXT = vk.vkCmdSetDepthCompareOpEXT;
pub const cmdSetDepthBoundsTestEnableEXT = vk.vkCmdSetDepthBoundsTestEnableEXT;
pub const cmdSetStencilTestEnableEXT = vk.vkCmdSetStencilTestEnableEXT;
pub const cmdSetStencilOpEXT = vk.vkCmdSetStencilOpEXT;
pub const getGeneratedCommandsMemoryRequirementsNV = vk.vkGetGeneratedCommandsMemoryRequirementsNV;
pub const cmdPreprocessGeneratedCommandsNV = vk.vkCmdPreprocessGeneratedCommandsNV;
pub const cmdExecuteGeneratedCommandsNV = vk.vkCmdExecuteGeneratedCommandsNV;
pub const cmdBindPipelineShaderGroupNV = vk.vkCmdBindPipelineShaderGroupNV;
pub const createIndirectCommandsLayoutNV = vk.vkCreateIndirectCommandsLayoutNV;
pub const destroyIndirectCommandsLayoutNV = vk.vkDestroyIndirectCommandsLayoutNV;
pub const createPrivateDataSlotEXT = vk.vkCreatePrivateDataSlotEXT;
pub const destroyPrivateDataSlotEXT = vk.vkDestroyPrivateDataSlotEXT;
pub const setPrivateDataEXT = vk.vkSetPrivateDataEXT;
pub const getPrivateDataEXT = vk.vkGetPrivateDataEXT;
pub const cmdSetFragmentShadingRateEnumNV = vk.vkCmdSetFragmentShadingRateEnumNV;
