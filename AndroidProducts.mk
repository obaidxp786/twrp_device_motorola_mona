#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 The TWRP Open Source Project
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_mona.mk \
    $(LOCAL_DIR)/omni_mona.mk

COMMON_LUNCH_CHOICES := \
    twrp_mona-eng \
    twrp_mona-userdebug \
    omni_mona-eng \
    omni_mona-userdebug
