#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/mainline/msm89xx-mainline/op8998

# Inherit options from mainline/qcom-common
TARGET_QCOM_SOC := msm8998
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_AUDIO_HAL := default-aidl
TARGET_HAS_BATTERY := false
TARGET_SUPPORTS_SUSPEND := false
TARGET_USES_FRAMEBUFFER_DISPLAY := true
include device/mainline/qcom-common/optional/options.mk

# Inherit from parent
$(call inherit-product, device/mainline/msm89xx-mainline/device.mk)

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Firmware
PRODUCT_COPY_FILES += \
    vendor/oneplus/msm8998-common/proprietary/vendor/firmware/a540_gpmu.fw2:$(TARGET_COPY_OUT_ODM)/firmware/qcom/a540_gpmu.fw2 \
    vendor/oneplus/msm8998-common/proprietary/vendor/firmware/a540_zap.elf:$(TARGET_COPY_OUT_ODM)/firmware/qcom/msm8998/oneplus/a540_zap.mbn

PRODUCT_PACKAGES += \
    all_symlink_firmware_op8998 \
    firmware_op8998_ipa_fws.mbn

# Init
PRODUCT_PACKAGES += \
    fstab.op8998 \
    fstab.op8998.ramdisk \
    init.op8998.rc \
    ueventd.op8998.rc

PRODUCT_PACKAGES += \
    use_memfd.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(TARGET_DEVICE_PATH)/overlays/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
