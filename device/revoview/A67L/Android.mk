
LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles)

ifeq ($(TARGET_DEVICE),A67L)
$(call inherit-product, vendor/revoview/A67L/Android.mk)
endif

