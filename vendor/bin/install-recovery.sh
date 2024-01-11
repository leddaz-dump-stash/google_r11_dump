#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13500000.dwmmc0/by-name/boot_b$(getprop ro.boot.slot_suffix):33554432:ebbe36270319496c25e424e6ed720903bc539e76; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13500000.dwmmc0/by-name/boot_a$(getprop ro.boot.slot_suffix):33554432:6d1e5160286973f39c5ad5064b7ef20aef80fb97 \
          --target EMMC:/dev/block/platform/13500000.dwmmc0/by-name/boot_b$(getprop ro.boot.slot_suffix):33554432:ebbe36270319496c25e424e6ed720903bc539e76 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
