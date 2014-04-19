$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/ls840/ls840-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/cayman/overlay

LOCAL_PATH := device/lge/ls840
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_cayman
PRODUCT_DEVICE := cayman
PRODUCT_BRAND := lge
PRODUCT_MODEL := ls840
PRODUCT_MANUFACTURER := lge

# Recovery
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	$(LOCAL_PATH)/recovery/ramdisk/init.lge.usb.sh:recovery/root/init.lge.usb.sh \
	$(LOCAL_PATH)/recovery/ramdisk/lgdms.fota.rc:recovery/root/lgdms.fota.rc \
	$(LOCAL_PATH)/recovery/ramdisk/ueventd.goldfish.rc:recovery/root/ueventd.goldfish.rc \
	$(LOCAL_PATH)/recovery/ramdisk/init.qcom.sh:recovery/root/init.qcom.sh \
	$(LOCAL_PATH)/recovery/ramdisk/lgdms.fota_update.rc:recovery/root/lgdms.fota_update.rc \
	$(LOCAL_PATH)/recovery/ramdisk/ueventd.rc:recovery/root/ueventd.rc \
	$(LOCAL_PATH)/recovery/ramdisk/init.qcom.usb.sh:recovery/root/init.qcom.usb.sh \
	$(LOCAL_PATH)/recovery/ramdisk/ueventd.cayman_sprint_us.rc:recovery/root/ueventd.cayman_sprint_us.rc
