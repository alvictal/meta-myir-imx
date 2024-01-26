# Add extra tools needed for Android mfgtools

RDEPENDS:${PN}-base += " \
    simg2img \
    gptfdisk \
    hdparm \
    iproute2 \
    nfs-utils \
"

RDEPENDS:${PN}-extfs += " \
    e2fsprogs \
    f2fs-tools \
"
