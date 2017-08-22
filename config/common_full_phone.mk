# Inherit common stuff
$(call inherit-product, vendor/eva/config/common.mk)
$(call inherit-product, vendor/eva/config/common_apn.mk)

# Telephony 
PRODUCT_PACKAGES += \
    Stk 

# SMS
PRODUCT_PACKAGES += \
	messaging
