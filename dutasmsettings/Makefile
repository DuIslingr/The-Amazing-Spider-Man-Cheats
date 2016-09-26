ARCHS = armv7 armv7s arm64
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 6.0
ADDITIONAL_OBJCFLAGS = -fvisibility=hidden -fobjc-arc

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = dutasmsettings
dutasmsettings_FILES = dutasmsettings.mm
dutasmsettings_INSTALL_PATH = /Library/PreferenceBundles
dutasmsettings_FRAMEWORKS = UIKit
dutasmsettings_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/dutasmsettings.plist$(ECHO_END)
