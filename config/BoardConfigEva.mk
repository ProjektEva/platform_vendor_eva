include vendor/eva/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/eva/config/BoardConfigQcom.mk
endif

include vendor/eva/config/BoardConfigSoong.mk
