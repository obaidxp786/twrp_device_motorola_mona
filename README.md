# TWRP Device Tree for Motorola Moto G Stylus 2025 (mona)

## Device Specifications

| Feature | Value |
|---|---|
| Device Codename | mona / mona_g |
| Model Number | XT2517-1 |
| Marketing Name | Motorola Moto G Stylus 2025 |
| SoC / Chipset | Qualcomm Snapdragon 6 Gen 3 (SM6475 - parrot) |
| Architecture | ARM64 (arm64-v8a) 64-bit only |
| Android Version | Android 15/16 (API 35/36) |
| Kernel Version | Linux 6.6 Generic Kernel Image (GKI) |
| Boot Header Version | v4 |
| Display Resolution | 1220 x 2712 pixels, 450 DPI |
| Partition Scheme | Virtual A/B (Dynamic Partitions in Super) |
| Recovery Partition | Dedicated recovery (`recovery_a` / `recovery_b`, 128 MB) |

---

## How to Build TWRP

### Method 1: Automated Free Cloud Build via GitHub Actions (Recommended)
1. Initialize git in this directory and push it to a new GitHub repository:
   ```bash
   cd device/motorola/mona
   git init
   git add .
   git commit -m "Initial TWRP device tree for Moto G Stylus 2025 (mona)"
   git branch -M main
   git remote add origin https://github.com/<your-username>/twrp_device_motorola_mona.git
   git push -u origin main
   ```
2. Open your repository on GitHub.
3. Click on the **Actions** tab.
4. Select **Build TWRP Recovery for Moto G Stylus 2025 (mona)** and click **Run workflow**.
5. Once completed, download the generated `recovery.img` from the Artifacts section.

---

### Method 2: Local Build on Ubuntu Linux (20.04 or 22.04 LTS)
Requirements:
- 64-bit Ubuntu installation
- At least 50 GB free disk space
- 16 GB RAM recommended

Commands:
```bash
# 1. Install build packages
sudo apt update
sudo apt install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev \
  gcc-multilib g++-multilib libc6-dev-i386 libncurses5 lib32ncurses5-dev x11proto-core-dev \
  libx11-dev lib32z1-dev libgl1-mesa-dev libxml2 libxml2-utils xsltproc unzip fontconfig \
  python3 rsync libssl-dev bc cpio

# 2. Setup repo tool
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin:$PATH

# 3. Initialize TWRP Minimal Manifest
mkdir -p ~/twrp && cd ~/twrp
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
repo sync -c --no-clone-bundle --no-tags -j$(nproc --all)

# 4. Clone or copy device tree
git clone <your-repo-url> device/motorola/mona

# 5. Build
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
lunch twrp_mona-eng
make -j$(nproc --all) recoveryimage
```

The output file will be generated at:
`out/target/product/mona/recovery.img`

---

## Flashing Instructions

> [!WARNING]
> Ensure your bootloader is unlocked before flashing custom recoveries.

1. Reboot your phone into Bootloader / Fastboot mode:
   ```bash
   adb reboot bootloader
   ```
2. Verify device connection:
   ```bash
   fastboot devices
   ```
3. Test TWRP temporarily without flashing (safest test):
   ```bash
   fastboot boot recovery.img
   ```
4. Flash permanently to the active recovery slot:
   ```bash
   fastboot flash recovery recovery.img
   ```
5. Reboot into recovery:
   ```bash
   fastboot reboot recovery
   ```
