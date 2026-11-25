<div align="center">
  <img src="https://xdaforums.com/proxy.php?image=https%3A%2F%2Fi.imgur.com%2Fk5tUT1V.png&hash=d45b54ad50fa2c2489fe487632e77e5f" alt="LineageOS" width="260" />
  <h3>LineageOS 18.1 (Unofficial) &bull; Samsung Galaxy A6 (2018)</h3>
  <p>
    <code>Android 11</code> &bull;
    <code>Linux 3.18.140</code> &bull;
    <code>SELinux Enforcing</code>
  </p>
</div>

---

### Source Repositories (`lineage-18.1-a6ltedx`)

| Component | Repository |
| :--- | :--- |
| **Kernel Source (GPLv2)** | [ReQoRB/android_kernel_samsung_exynos7870](https://github.com/ReQoRB/android_kernel_samsung_exynos7870/tree/lineage-18.1-a6ltedx) |
| **Device Tree (SM-A600G)** | [ReQoRB/android_device_samsung_a6ltedx](https://github.com/ReQoRB/android_device_samsung_a6ltedx/tree/lineage-18.1-a6ltedx) |
| **Common Device Tree** | [ReQoRB/android_device_samsung_universal7870-common](https://github.com/ReQoRB/android_device_samsung_universal7870-common/tree/lineage-18.1-a6ltedx) |
| **Vendor Blobs (SM-A600G)** | [ReQoRB/android_vendor_samsung_a6ltedx](https://github.com/ReQoRB/android_vendor_samsung_a6ltedx/tree/lineage-18.1-a6ltedx) |
| **Common Vendor Blobs** | [ReQoRB/android_vendor_samsung_universal7870-common](https://github.com/ReQoRB/android_vendor_samsung_universal7870-common/tree/lineage-18.1-a6ltedx) |
| **Manifest & Patches** | [`local_manifests/a6ltedx.xml`](local_manifests/a6ltedx.xml) &bull; [`patches/`](patches) &bull; [`apply_patches.sh`](apply_patches.sh) |

---

### Reproducing the Build

```bash
mkdir -p ~/lineage && cd ~/lineage
repo init -u [https://github.com/LineageOS/android.git](https://github.com/LineageOS/android.git) -b lineage-18.1 --git-lfs
mkdir -p .repo/local_manifests
curl -L -o .repo/local_manifests/a6ltedx.xml \
  [https://raw.githubusercontent.com/ReQoRB/lineage-18.1-a6ltedx/main/local_manifests/a6ltedx.xml](https://raw.githubusercontent.com/ReQoRB/lineage-18.1-a6ltedx/main/local_manifests/a6ltedx.xml)
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

git clone [https://github.com/ReQoRB/lineage-18.1-a6ltedx.git](https://github.com/ReQoRB/lineage-18.1-a6ltedx.git) /tmp/lineage-18.1-a6ltedx
/tmp/lineage-18.1-a6ltedx/apply_patches.sh "$(pwd)"

source build/envsetup.sh
lunch lineage_a6lte-userdebug
mka bacon
```
