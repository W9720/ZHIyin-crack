ARCHS = arm64
TARGET := iphone:clang:latest:14.0
PACKAGE_VERSION = 1.0.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WeeklyVIP

WeeklyVIP_FILES = Tweak.x
WeeklyVIP_CFLAGS = -fobjc-arc
WeeklyVIP_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Weekly 2>/dev/null || true"

# SUBPROJECTS += weeklyvipprefs
# include $(THEOS_MAKE_PATH)/aggregate.mk
