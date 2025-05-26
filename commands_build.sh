#! /bin/bash

rm -rf .repo/local_manifests; \

repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs; \

/opt/crave/resync.sh; \

rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf device/xiaomi/sm8250-common; \
rm -rf kernel/xiaomi/sm8250; \
rm -rf vendor/xiaomi/munch; \
rm -rf vendor/xiaomi/sm8250-common; \
rm -rf hardware/xiaomi; \
rm -rf vendor/xiaomi/munch-firmware; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \
rm -rf packages/apps/ViPER4AndroidFX; \

git clone https://github.com/olzhas0986-dev/hdzung_device_xiaomi_munch.git device/xiaomi/munch; \
git clone https://github.com/munch-devs/android_vendor_xiaomi_munch.git vendor/xiaomi/munch; \
git clone https://gitlab.com/rik-x777/vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \
git clone https://github.com/munch-devs/kernel_xiaomi_sm8250.git kernel/xiaomi/munch; \
git clone https://github.com/munch-devs/android_hardware_xiaomi.git hardware/xiaomi; \
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \
git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX; \
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

export KBUILD_BUILD_USER=olzhas0986
export KBUILD_BUILD_HOST=dev

. build/envsetup.sh; \
riseup munch userdebug; \
rise b; \

cd device/xiaomi/munch && rm -rf lineage_munch.mk && mv gapps.txt lineage_munch.mk && cd ../../..; \
. build/envsetup.sh; \
riseup munch userdebug; \
rise b
