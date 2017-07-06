# Unholy versioning System
PRODUCT_VERSION_MAJOR = 2
PRODUCT_VERSION_MINOR = 5
PRODUCT_VERSION_MAINTENANCE = 1
ifdef UNHOLY_BUILD_EXTRA
    UNHOLY_POSTFIX := -$(UNHOLY_BUILD_EXTRA)
endif
ifndef UNHOLY_BUILD_TYPE
    UNHOLY_BUILD_TYPE := EXPERIMENTAL
endif

UNHOLY_POSTFIX := $(shell date +"%Y%m%d")
UNHOLY_DEVICE_SHORT := $(UNHOLY_DEVICE)
UNHOLY_DEVICE_SHORT := $(subst unholy_,,$(UNHOLY_DEVICE_SHORT))

# Set all versions
UNHOLY_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(UNHOLY_BUILD_TYPE)-$(UNHOLY_POSTFIX)
UNHOLY_MOD_VERSION := unholy-$(UNHOLY_DEVICE_SHORT)-$(UNHOLY_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.ota.version=$(PRODUCT_VERSION_MAJOR)-$(UNHOLY_POSTFIX) \
    ro.unholy.version=$(UNHOLY_VERSION) \
    ro.modversion=$(UNHOLY_MOD_VERSION) \
    ro.unholy.buildtype=$(UNHOLY_BUILD_TYPE)