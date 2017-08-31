PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup tool
PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/eva/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/eva/prebuilt/common/bin/50-eva.sh:system/addon.d/50-eva.sh

# Backup services whitelist
PRODUCT_COPY_FILES += \
    vendor/eva/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# eva-specific init file
PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/etc/init.local.rc:root/init.eva.rc

# Copy LatinIME for gesture typing
PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/eva/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/eva/prebuilt/common/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml 

# eva-specific startup services
PRODUCT_COPY_FILES += \
    vendor/eva/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/eva/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/eva/prebuilt/common/bin/sysinit:system/bin/sysinit

# Required packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Development \
    SpareParts \
    LockClock \
    su

# Optional packages
PRODUCT_PACKAGES += \
    Basic \
    LiveWallpapersPicker \
    PhaseBeam

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# AudioFX
PRODUCT_PACKAGES += \
    AudioFX

# Extra Optional packages
PRODUCT_PACKAGES += \
    Calculator \
    LatinIME \
    BluetoothExt 
# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Explict rootless defined, or none of the root methods defined,
# default rootless : nothing todo
#ifeq ($(DEFAULT_ROOT_METHOD),rootless)
#endif

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/eva/overlay/common

# Versioning System
# eva first version.
PRODUCT_VERSION_MAJOR = 1.0
PRODUCT_VERSION_MINOR = ALPHA
PRODUCT_VERSION_MAINTENANCE = 1.0
EVA_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
ifdef EVA_BUILD_EXTRA
    EVA_POSTFIX := -$(EVA_BUILD_EXTRA)
endif

ifndef EVA_BUILD_TYPE
    EVA_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions
EVA_VERSION := eva-$(EVA_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(EVA_BUILD_TYPE)$(EVA_POSTFIX)
EVA_MOD_VERSION := eva-$(EVA_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(EVA_BUILD_TYPE)$(EVA_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    eva.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.eva.version=$(EVA_VERSION) \
    ro.modversion=$(EVA_MOD_VERSION) \
    ro.eva.buildtype=$(EVA_BUILD_TYPE)

EXTENDED_POST_PROCESS_PROPS := vendor/eva/tools/eva_process_props.py

