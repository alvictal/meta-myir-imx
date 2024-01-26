# Copyright 2017-2018 NXP

DESCRIPTION = "i.MX HANTRO VPU library"
LICENSE = "Proprietary"

inherit fsl-eula-unpack use-imx-headers

PARALLEL_MAKE="-j 1"

PROVIDES = "virtual/imxvpu"
RPROVIDES:${PN} = "virtual/imxvpu"

SRC_URI = "${FSL_MIRROR}/${BP}.bin;fsl-eula=true"

PLATFORM:mx8mm = "IMX8MM"
PLATFORM:mx8mq = "IMX8MQ"
PLATFORM:mx8mp = "IMX8MP"

do_compile () {
    oe_runmake CROSS_COMPILE="${HOST_PREFIX}" SDKTARGETSYSROOT="${STAGING_DIR_TARGET}" PLATFORM="${PLATFORM}" all
}

do_install () {
    oe_runmake DEST_DIR="${D}" PLATFORM="${PLATFORM}" install
}

FILES:${PN} += "/unit_tests"

PACKAGE_ARCH = "${MACHINE_ARCH}"

COMPATIBLE_MACHINE = "(mx8mq|mx8mm|mx8mp)"
