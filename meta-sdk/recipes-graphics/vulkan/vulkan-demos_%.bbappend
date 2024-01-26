
SRC_URI:append = " file://0001-Modify-parameter-in-vulkan-demo-computenbody.patch \
                   file://0001-Fix-bug-in-computeheadless-and-renderheadless.patch"
SRCREV = "21f9cd52519fab405827ecc965910bf269af3342"
DEPENDS:remove = "vulkan"
DEPENDS:append = " vulkan-headers vulkan-loader"
