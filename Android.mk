# Copyright 2011 Crossbones Software

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-java-files-under,src)

LOCAL_STATIC_JAVA_LIBRARIES := \
    android-support-v4

LOCAL_PACKAGE_NAME := CATTools

# disable proguard to make easy debugging
LOCAL_PROGUARD_FLAG_FILES := proguard.cfg

# sign apk with cattools key
#LOCAL_CERTIFICATE := cattools

include $(BUILD_PACKAGE)
