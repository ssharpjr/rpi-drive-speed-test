#!/bin/bash
# Tests Raspberry Pi disk read/write speed

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
echo "=== Performing Write Speed Test ==="
dd if=/dev/zero of=test.tmp bs=500K count=1024 oflag=dsync
sync; echo 3 | tee /proc/sys/vm/drop_caches
echo "=== Performing Read Speed Test ==="
dd if=test.tmp of=/dev/null bs=500K count=1024
rm -rf test.tmp
echo "=== Speed Test Complete ==="
