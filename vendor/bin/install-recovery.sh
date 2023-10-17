#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/13500000.dwmmc0/by-name/boot_b$(getprop ro.boot.slot_suffix):33554432:efb4ad6b917ccefd4d3994d85baf2ad44ad1d210; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/13500000.dwmmc0/by-name/boot_a$(getprop ro.boot.slot_suffix):33554432:c49cb721947fb5fbab43ee485b59c3140dae5d91 \
          --target EMMC:/dev/block/platform/13500000.dwmmc0/by-name/boot_b$(getprop ro.boot.slot_suffix):33554432:efb4ad6b917ccefd4d3994d85baf2ad44ad1d210 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
