# Charger
#ifneq ($(WITH_CM_CHARGER),false)
#    BOARD_HAL_STATIC_LIBRARIES := libhealthd.cm
#endif

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/eva/config/BoardConfigQcom.mk
endif
