# Set all versions
EVA_BUILD_TYPE ?= UNOFFICIAL

EVA_DATE_YEAR := $(shell date -u +%Y)
EVA_DATE_MONTH := $(shell date -u +%m)
EVA_DATE_DAY := $(shell date -u +%d)
EVA_DATE_HOUR := $(shell date -u +%H)
EVA_DATE_MINUTE := $(shell date -u +%M)
EVA_BUILD_DATE_UTC := $(shell date -d '$(EVA_DATE_YEAR)-$(EVA_DATE_MONTH)-$(EVA_DATE_DAY) $(EVA_DATE_HOUR):$(EVA_DATE_MINUTE) UTC' +%s)
EVA_BUILD_DATE := $(EVA_DATE_YEAR)$(EVA_DATE_MONTH)$(EVA_DATE_DAY)-$(EVA_DATE_HOUR)$(EVA_DATE_MINUTE)

EVA_PLATFORM_VERSION := androidX

TARGET_PRODUCT_SHORT := $(subst eva_,,$(EVA_BUILD))

EVA_VERSION := ProjektEva_$(EVA_BUILD)-$(EVA_PLATFORM_VERSION)-$(EVA_BUILD_DATE)-$(EVA_BUILD_TYPE)
EVA_VERSION_PROP := androidX
ROM_FINGERPRINT := ProjektEva/$(EVA_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(EVA_BUILD_DATE)

EVA_PROPERTIES := \
    ro.eva.version=$(EVA_VERSION_PROP) \
    ro.eva.version.display=$(EVA_VERSION) \
    ro.eva.build_date=$(EVA_BUILD_DATE) \
    ro.eva.build_date_utc=$(EVA_BUILD_DATE_UTC) \
    ro.eva.build_type=$(EVA_BUILD_TYPE) \
    ro.eva.fingerprint=$(ROM_FINGERPRINT)
