SOC_TOOLS_GPU:append:imxgpu   = " gputop imx-gpu-sdk"

SOC_TOOLS_GPU:append:mx8   = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' xf86-video-modesetting','', d)}"
SOC_TOOLS_GPU:append:mx8dx    = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' xserver-xorg-extension-glx','', d)}"
SOC_TOOLS_GPU:append:mx8dxl   = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' xserver-xorg-extension-glx','', d)}"
SOC_TOOLS_GPU:append:mx8mnlite   = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' xserver-xorg-extension-glx','', d)}"

SOC_TOOLS_GPU:remove:imxgpu3d = "imx-gpu-apitrace-bin"

SOC_TOOLS_GPU:append:imxdrm = " libdrm-tests"
