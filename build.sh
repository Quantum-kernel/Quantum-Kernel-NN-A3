#!/bin/bash
DTS=arch/arm64/boot/dts
RDIR=$(pwd)
# GCC
export CROSS_COMPILE=/home/prashantp/gcc-linaro-7.2.1/bin/aarch64-linux-gnu-
# Cleanup
make clean && make mrproper
# J700F NN Defcon
make a3xelte_00_defconfig
make exynos7580-a3xelte_eur_open_00.dtb exynos7580-a3xelte_eur_open_01.dtb exynos7580-a3xelte_eur_open_02.dtb
# Make zImage
make ARCH=arm64 -j5
# Make DT.img
./tools/dtbtool -o ./boot.img-dtb -v -s 2048 -p ./scripts/dtc/ $DTS/
# Cleaup
rm -rf $DTS/.*.tmp
rm -rf $DTS/.*.cmd
rm -rf $DTS/*.dtb
