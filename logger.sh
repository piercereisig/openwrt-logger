#!/bin/sh

# CSV output file
CSV="/root/openwrt_live.csv"

# Write CSV header
echo "date,time,rx_bytes,tx_bytes,ap_signal_dbm,ap_noise_dbm,mesh_signal_dbm,mesh_noise_dbm" > "$CSV"

# Main logging loop
while true; do
  DATE=$(date "+%Y-%m-%d")
  TIME=$(date "+%H:%M:%S")

  RX=$(awk '/br-lan:/ {print $2}' /proc/net/dev)
  TX=$(awk '/br-lan:/ {print $10}' /proc/net/dev)

  AP_SIG=$(iwinfo phy0-ap0 info | awk '/Signal:/ {print $2}')
  AP_NOI=$(iwinfo phy0-ap0 info | awk '/Noise:/ {print $2}')

  MESH_SIG=$(iwinfo phy1-mesh0 info | awk '/Signal:/ {print $2}')
  MESH_NOI=$(iwinfo phy1-mesh0 info | awk '/Noise:/ {print $2}')

  echo "$DATE,$TIME,$RX,$TX,$AP_SIG,$AP_NOI,$MESH_SIG,$MESH_NOI" >> "$CSV"

  sleep 3
done
