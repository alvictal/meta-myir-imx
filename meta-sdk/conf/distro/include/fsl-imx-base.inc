require conf/distro/poky.conf

DISTRO = "imx-nxp"
DISTRO_NAME = "NXP i.MX Release Distro"
DISTRO_VERSION = "5.10-gatesgarth"

MAINTAINER = "NXP <lauren.post@nxp.com>"

REMOVE_VULKAN_FEATURE = "vulkan"
REMOVE_VULKAN_FEATURE:mx8 = ""
POKY_DEFAULT_DISTRO_FEATURES:remove      = "wayland ${REMOVE_VULKAN_FEATURE}"
POKY_DEFAULT_DISTRO_FEATURES:append:mx8  = " jailhouse"

INHERIT:remove = "uninative"
