# Inherit common stuff
$(call inherit-product, vendor/eva/config/common.mk)

PRODUCT_PACKAGE_OVERLAYS += vendor/eva/overlay/tablet

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf
