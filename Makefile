ARCHS = armv7 arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 6.0
TARGET_STRIP_FLAGS = -u -r -s /dev/null

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = dutasm
dutasm_FILES = TASMtweak.xm
dutasm_FRAMEWORKS = UIKit
dutasm_CFLAGS ?= -fobjc-arc -DALWAYS_INLINE=1 -O0 -std=c++11 -stdlib=libc++
dutasm_LIBRARIES = Liberation substrate c++

include $(THEOS_MAKE_PATH)/tweak.mk

# after-install::
# 	install.exec "killall -9 SpringBoard"
SUBPROJECTS += dutasmsettings
include $(THEOS_MAKE_PATH)/aggregate.mk
