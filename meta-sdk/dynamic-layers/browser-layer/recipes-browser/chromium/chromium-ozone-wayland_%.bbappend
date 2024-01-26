FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://0002-chromium-fix-build-after-y2038-changes-in-glibc.patch \
                   file://Fix-build-breaks-on-non-gbm-machines.patch \
                   file://Remove-use-of-register-r7.patch \
"

REQUIRED_DISTRO_FEATURES = "wayland"

DEPENDS += "\
        libxkbcommon \
        virtual/egl \
        wayland \
        wayland-native \
        at-spi2-atk \
"
GN_ARGS += ' \
        system_wayland_scanner_path="${STAGING_BINDIR_NATIVE}/wayland-scanner" \
        use_lld=false \
'
# gbm is availiable only for mx8, but still drop it for 8MQ in 2020 Q4 release
GN_ARGS:append:mx6 = " use_system_minigbm=false use_wayland_gbm=false"
GN_ARGS:append:mx7 = " use_system_minigbm=false use_wayland_gbm=false"
GN_ARGS:append:mx8 = " use_system_minigbm=false use_wayland_gbm=false"

CHROMIUM_EXTRA_ARGS:append = " --disable-features=VizDisplayCompositor --in-process-gpu"

# Clang does not yet support big.LITTLE performance tunes, so use the LITTLE for tunes
TUNE_CCARGS:remove = "-mcpu=cortex-a72.cortex-a53"
TUNE_CCARGS:append:mx8 = " -mcpu=cortex-a53"
