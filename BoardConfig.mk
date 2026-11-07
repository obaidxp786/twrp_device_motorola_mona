#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 The TWRP Open Source Project
#

DEVICE_PATH := device/motorola/mona

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := kryo300
TARGET_CPU_VARIANT_RUNTIME := kryo300

# Platform
TARGET_BOARD_PLATFORM := parrot
TARGET_BOOTLOADER_BOARD_NAME := mona
TARGET_USES_64_BIT_BINDER := true

# Assert
TARGET_OTA_ASSERT_DEVICE := mona,mona_g

# Kernel & Boot Image Header v4
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_CMDLINE := video=vfb:640x400,bpp=32,memsize=3072000 nosoftlockup console=ttynull qcom_geni_serial.con_enabled=0 printk.devkmsg=on firmware_class.path=/vendor/firmware_mnt/image bootconfig
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Prebuilt Kernel & DTB
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBIMAGE := $(DEVICE_PATH)/prebuilt/dtb
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partitions & Sizes
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 24117248
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_COPY_OUT_RECOVERY := recovery

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm system_dlkm
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200

# A/B & Virtual A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    pvmfw \
    recovery \
    system \
    system_ext \
    product \
    vendor \
    vendor_boot \
    vendor_dlkm \
    vbmeta \
    vbmeta_system

# File Systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_USES_METADATA_PARTITION := true

# Recovery & TWRP Settings
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TW_THEME := portrait_hdpi
DEVICE_SCREEN_WIDTH := 1220
DEVICE_SCREEN_HEIGHT := 2712
TARGET_SCREEN_DENSITY := 450
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_EXCLUDE_APEX := true
TW_INCLUDE_FASTBOOTD := true
TW_NO_BIND_SYSTEM := true
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_TEMP_PATH := "/sys/devices/virtual/thermal/thermal_zone0/temp"
TW_BATTERY_SYSFS_WAIT_SECONDS := 5
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 1024

# Decryption / CryptFS / FBE
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
PLATFORM_VERSION := 16
PLATFORM_VERSION_LAST_STABLE := 15
PLATFORM_SECURITY_PATCH := 2026-07-01
