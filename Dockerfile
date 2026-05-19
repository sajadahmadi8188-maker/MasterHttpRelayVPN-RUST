# این فایل به SnapDeploy می‌گوید که هیچ کاری برای Build انجام نده
# فقط Image از پیش ساخته شده را مستقیماً Pull و Run کند.

FROM ghcr.io/therealaleph/mhrv-tunnel-node:latest

# متغیرهای پیش‌فرض (اختیاری)
ENV PORT=8888
ENV RUST_LOG=error

EXPOSE 8888

# دستور Run دقیقاً همان چیزی است که در Image اصلی وجود دارد
ENTRYPOINT ["/usr/local/bin/mhrv-rs"]
CMD ["--mode", "full", "--port", "8888"]
