FROM ghcr.io/therealaleph/mhrv-tunnel-node:latest

# تنظیم متغیرهای پیش‌فرض (اختیاری - می‌تونی توی SnapDeploy اووررایت کنی)
ENV PORT=8888
ENV TUNNEL_AUTH_KEY=changeme
ENV RUST_LOG=info

EXPOSE 8888

# این دستور مطمئن می‌شه برنامه با متغیرهای درست اجرا بشه
CMD ["/usr/local/bin/mhrv-rs", "--mode", "full", "--port", "8888"]
