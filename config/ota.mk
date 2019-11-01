ifeq ($(EVA_BUILD_TYPE), OFFICIAL)

EVA_OTA_VERSION_CODE := androidX

EVA_PROPERTIES += \
    ro.eva.ota.version_code=$(EVA_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/eva/config/permissions/org.projekteva.ota.xml:system/etc/permissions/org.projekteva.ota.xml

endif
