#!/bin/bash

# Removing local_manifests
rm -rf .repo/local_manifests; \

# Init
repo init -u https://github.com/AxionAOSP/android.git -b lineage-22.2 --git-lfs; \

# repo sync
/opt/crave/resync.sh; \

# Removing old device specific repos
rm -rf out/target/product/munch
rm -rf kernel/xiaomi/munch
rm -rf device/xiaomi/munch
rm -rf vendor/xiaomi/munch
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi/miuicamera 
rm -rf packages/resources/devicesettings
rm -rf packages/apps/ViPER4AndroidFX; \
######### End

# Cloning new device specific repos
git clone device/xiaomi/munch; \

git clone  kernel/xiaomi/munch; \

git clone  vendor/xiaomi/munch; \

git clone  hardware/xiaomi; \

git clone  vendor/xiaomi/miuicamera; \

git clone https://github.com/PocoF3Releases/packages_resources_devicesettings.git packages/resources/devicesettings; \

git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX.git packages/apps/ViPER4AndroidFX; \
######## End

# Useless shit
export TZ=Asia/Atyrau

# Building: AxionAOSP
. build/envsetup.sh; \
lunch lineage_munch-bp1a-userdebug; \
mka bacon #mmmm bacon 
