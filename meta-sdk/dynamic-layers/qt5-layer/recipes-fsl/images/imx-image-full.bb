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
OPENCV_PKGS:imxgpu = " \
    opencv-apps \
    opencv-samples \
    python3-opencv \
"

IMAGE_INSTALL += " \
    ${OPENCV_PKGS} \
    ${ML_PKGS} \
    packagegroup-qt5-imx \
    tzdata \
"

TOOLCHAIN_TARGET_TASK += " \
    ${ML_STATICDEV} \
"
