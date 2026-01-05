# OpenWrt Network Logger

This project runs a data-logging program directly on an OpenWrt router
to collect live bandwidth and wireless signal data.

## Files
- logger.sh — main logging program
- logger — OpenWrt service file (start/stop/status)

## What it does
- Logs RX/TX byte counts
- Logs Wi-Fi signal and noise levels
- Writes data to a CSV file on the router

## Usage (on OpenWrt)

Start logging:
    /etc/init.d/logger start

Stop logging:
    /etc/init.d/logger stop

Check status:
    /etc/init.d/logger status

View live data:
    tail -f /root/openwrt_live.csv

Export CSV:
    cp /root/openwrt_live.csv /www/
