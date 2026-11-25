# LineageOS 18.1 (Unofficial) - Samsung Galaxy A6 SM-A600G (a6ltedx)

- **ROM OS Version:** Android 11 (LineageOS 18.1)
- **ROM Kernel:** Linux 3.18.140
- **SELinux Status:** True **Enforcing**
- **Target Variant:** Samsung Galaxy A6 2018 — **SM-A600G (`a6ltedx`)**, Exynos 7870 (single-mic, non-NFC)
- **Status:** Stable / Unofficial
- **Last Updated:** 2026-11-24

## Complete Source Repositories (`lineage-18.1-a6ltedx`)

- **Kernel Source (GPLv2):** https://github.com/ReQoRB/android_kernel_samsung_exynos7870/tree/lineage-18.1-a6ltedx
- **Device Tree (SM-A600G / a6ltedx):** https://github.com/ReQoRB/android_device_samsung_a6ltedx/tree/lineage-18.1-a6ltedx
- **Common Device Tree (universal7870-common):** https://github.com/ReQoRB/android_device_samsung_universal7870-common/tree/lineage-18.1-a6ltedx
- **Vendor Blobs (SM-A600G / a6ltedx):** https://github.com/ReQoRB/android_vendor_samsung_a6ltedx/tree/lineage-18.1-a6ltedx
- **Common Vendor Blobs (universal7870-common):** https://github.com/ReQoRB/android_vendor_samsung_universal7870-common/tree/lineage-18.1-a6ltedx
- **Platform & HAL Patches:** [`patches/`](patches) + [`apply_patches.sh`](apply_patches.sh)
- **Local Manifest:** [`local_manifests/a6ltedx.xml`](local_manifests/a6ltedx.xml)

## Reproducing the Build from Scratch

```bash
mkdir -p ~/lineage && cd ~/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1 --git-lfs
mkdir -p .repo/local_manifests
curl -L -o .repo/local_manifests/a6ltedx.xml \
  https://raw.githubusercontent.com/ReQoRB/lineage-18.1-a6ltedx/main/local_manifests/a6ltedx.xml
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

git clone https://github.com/ReQoRB/lineage-18.1-a6ltedx.git /tmp/lineage-18.1-a6ltedx
/tmp/lineage-18.1-a6ltedx/apply_patches.sh "$(pwd)"

source build/envsetup.sh
lunch lineage_a6lte-userdebug
mka bacon
```
