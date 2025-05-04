#!/bin/bash

# Removing local_manifests
rm -rf .repo/local_manifests; \

# Init ROM
repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fifteen --git-lfs; \

# repo sync
/opt/crave/resync.sh; \

# Removing old device specific repos
rm -rf out/target/product/munch
rm -rf device/xiaomi/munch
rm -rf device/xiaomi/sm8250-common
rm -rf kernel/xiaomi/sm8250; \
rm -rf vendor/xiaomi/munch
rm -rf vendor/xiaomi/sm8250-common
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi/munch-firmware; \
rm -rf vendor/xiaomi/miuicamera 
rm -rf packages/resources/devicesettings
rm -rf packages/apps/ViPER4AndroidFX; \
######### End

# Cloning new device specific repos
git clone https://github.com/olzhas0986-dev/android_device_xiaomi_munch.git -b aosp device/xiaomi/munch; \

git clone https://github.com/olzhas0986-dev/kernel_xiaomi_sm8250 kernel/xiaomi/munch; \

git clone https://github.com/munch-devs/android_vendor_xiaomi_munch.git vendor/xiaomi/munch; \

git clone https://github.com/olzhas0986-dev/hardware_xiaomi.git -b vic hardware/xiaomi; \

git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera.git -b vic vendor/xiaomi/miuicamera; \

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings.git packages/resources/devicesettings; \
######## End

# Useless shit
export BUILD_USERNAME=olzhas0986 
export BUILD_HOSTNAME=crave 
export TZ=Asia/Atyrau

# Building: PixelOS
. build/envsetup.sh; \
lunch aosp_munch-bp1a-user; \
mka bacon
