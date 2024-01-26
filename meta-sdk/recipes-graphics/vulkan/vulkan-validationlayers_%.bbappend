FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI += " \
    file://icd_VSI.json \
    file://0001-CMakeLists.txt-Change-the-installation-path-of-JSON-.patch \
"
# choose wayland
PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '' ,d)}"

DEPENDS += " virtual/egl glslang spirv-tools"

EXTRA_OECMAKE:remove = "-DBUILD_LAYERS=OFF"
# Enable validation layers
EXTRA_OECMAKE:append = " -DBUILD_LAYERS=ON"

do_install:append () {

    install -d ${D}${sysconfdir}/vulkan/icd.d
    cp ${WORKDIR}/icd_VSI.json ${D}${sysconfdir}/vulkan/icd.d
    sed -i "s,/usr/lib,${libdir}," ${D}${sysconfdir}/vulkan/icd.d/icd_VSI.json
    sed -i "s,1.0.30,${PV}," ${D}${sysconfdir}/vulkan/icd.d/icd_VSI.json
}

FILES_SOLIBSDEV = ""
FILES:${PN} += "${libdir}/libVkLayer_*.so"

INSANE_SKIP:${PN} = "dev-so"

COMPATIBLE_MACHINE = "(mx8)"
COMPATIBLE_MACHINE:mx8mm = "(^$)"
