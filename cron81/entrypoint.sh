#!/bin/sh

echo "[INFO] Loading cron file..."

crontab /etc/cron.d/app-cron

echo "[INFO] Starting cron..."

exec cron -f
