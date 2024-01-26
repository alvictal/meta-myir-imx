# Use source package from CAF because of frequent fetch errors.
SRC_URI:remove = "http://sourceforge.net/projects/openil/files/DevIL/${PV}/DevIL-${PV}.zip"

SRC_URI:prepend = "https://sourceforge.net/projects/openil/files/DevIL/DevIL-${PV}.zip "
