$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/ls840/ls840-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/ls840/overlay

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
PRODUCT_NAME := full_ls840
PRODUCT_DEVICE := ls840
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
	
# Camera
PRODUCT_PACKAGES += \
	camera.msm8660

# Sensors
PRODUCT_PACKAGES += \
	lights.msm8660 \
	sensors.msm8660
	
# QCOM Display
PRODUCT_PACKAGES += \
    camera.msm8660 \
    copybit.msm8660 \
    gralloc.msm8660 \
    hwcomposer.msm8660 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer
    
# Telephony property for CDMA
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.vc_call_vol_steps=14 \
    ro.telephony.default_network=4 \
    ro.com.google.clientidbase=android-sprint-us \
    ro.cdma.home.operator.numeric=310120 \
    ro.cdma.home.operator.alpha=Sprint \
    net.cdma.pppd.authtype=require-pap \
    net.cdma.pppd.user=user[SPACE]SprintNextel \
    net.cdma.datalinkinterface=/dev/ttyCDMA0 \
    net.interfaces.defaultroute=cdma \
    net.cdma.ppp.interface=ppp0 \
    net.connectivity.type=CDMA1 \
    mobiledata.interfaces=ppp0 \
    ro.carrier=Sprint	
    
# Vold
PRODUCT_COPY_FILES += \
	device/lge/ls840/configs/vold.fstab:system/etc/vold.fstab
	
# Bluetooth configuration files
PRODUCT_COPY_FILES += \
	system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf 

# Get the long list of APNs
PRODUCT_COPY_FILES := device/lge/ls840/configs/apns-full-conf.xml:system/etc/apns-conf.xml

# Keylayout
PRODUCT_COPY_FILES += \
    device/lge/ls840/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/lge/ls840/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/lge/ls840/usr/keylayout/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    device/lge/ls840/usr/keylayout/touch_dev.kl:system/usr/keylayout/touch_dev.kl \
    device/lge/ls840/usr/keylayout/touch-keypad.kl:system/usr/keylayout/touch-keypad.kl \
    device/lge/ls840/usr/keylayout/Vendor_05ac_Product_0239.kl:system/usr/keylayout/Vendor_05ac_Product_0239.kl \
    device/lge/ls840/usr/keylayout/Vendor_22b8_Product_093d.kl:system/usr/keylayout/Vendor_22b8_Product_093d.kl \
    device/lge/ls840/usr/keylayout/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_028e.kl \
    device/lge/ls840/usr/keylayout/Vendor_046d_Product_c216.kl:system/usr/keylayout/Vendor_046d_Product_c216.kl \
    device/lge/ls840/usr/keylayout/Vendor_046d_Product_c294.kl:system/usr/keylayout/Vendor_046d_Product_c294.kl \
    device/lge/ls840/usr/keylayout/Vendor_046d_Product_c299.kl:system/usr/keylayout/Vendor_046d_Product_c299.kl \
    device/lge/ls840/usr/keylayout/Vendor_046d_Product_c532.kl:system/usr/keylayout/Vendor_046d_Product_c532.kl \
    device/lge/ls840/usr/keylayout/Vendor_054c_Product_0268.kl:system/usr/keylayout/Vendor_054c_Product_0268.kl

# Keychars
PRODUCT_COPY_FILES += \
   device/lge/ls840/usr/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
   device/lge/ls840/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
   device/lge/ls840/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
   device/lge/ls840/usr/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

#idc
PRODUCT_COPY_FILES += \
   device/lge/ls840/usr/idc/touch_dev.idc:system/usr/idc/touch-dev.idc \
   device/lge/ls840/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
   device/lge/ls840/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
   
