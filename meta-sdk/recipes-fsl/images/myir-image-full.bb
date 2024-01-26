# Copyright (C) 2015 Freescale Semiconductor
# Copyright 2017-2019 NXP
# Released under the MIT license (see COPYING.MIT for the terms)

require recipes-fsl/images/imx-image-multimedia.bb

inherit populate_sdk_qt5

CONFLICT_DISTRO_FEATURES = "directfb"
# Add machine learning for certain SoCs
ML_PKGS                   ?= ""
ML_STATICDEV              ?= ""
ML_PKGS:mx8                = "packagegroup-imx-ml"
ML_STATICDEV:mx8           = "tensorflow-lite-staticdev"
ML_PKGS:mx8dxl             = ""
ML_STATICDEV:mx8dxl        = ""
ML_PKGS:mx8phantomdxl      = ""
ML_STATICDEV:mx8phantomdxl = ""
ML_PKGS:mx8mnlite          = ""
ML_STATICDEV:mx8mnlite     = ""

# Add opencv for i.MX GPU
OPENCV_PKGS       ?= ""
OPENCV_PKGS_imxgpu = " \
    opencv-apps \
    opencv-samples \
    python3-opencv \
"

IMAGE_INSTALL += " \
    ${OPENCV_PKGS} \
    ${ML_PKGS} \
    packagegroup-qt5-imx \
    tzdata \
    python3 \
    staticip-network \
    start-service \
    myir-linux-examples \
    firmware-brcm43362 \
    qt-demo \
    ppp-quectel \
    libgpiod \
    libgpiod-tools \
    u-boot-fw-utils \
    can-utils \
    memtester \
    sqlite3 \
    tslib \
    tslib-calibrate \
    tslib-conf \
    tslib-tests \
    quectel-cm \
    iperf3 \
    proftpd \
    hostapd \
    iptables \
    packagegroup-imx-core-tools \
    qtvirtualkeyboard \
    qtmultimedia \
    qtquickcontrols2 \
    qtquickcontrols \
"


IMAGE_INSTALL:append = "ffmpeg alsa-utils v4l-utils"

TOOLCHAIN_TARGET_TASK += " \
    ${ML_STATICDEV} \
"
