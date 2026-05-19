FROM rust:1.85-slim-bookworm AS builder

WORKDIR /app

# کپی کردن فایل‌های Cargo
COPY Cargo.toml Cargo.lock ./

# ساخت یک dummy پروژه برای کش کردن وابستگی‌ها
RUN mkdir src && \
    echo "fn main() { println!(\"dummy\"); }" > src/main.rs && \
    cargo build --release && \
    rm -rf src

# کپی کردن سورس واقعی
COPY src/ ./src/

# ساخت باینری درست با اسم mhrv-rs
RUN cargo build --release --bin mhrv-rs && \
    cp /app/target/release/mhrv-rs /usr/local/bin/mhrv-rs

# مرحله نهایی (Runtime)
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/mhrv-rs /usr/local/bin/mhrv-rs

# تنظیم پورت
ENV PORT=8888
EXPOSE 8888

# اجرا با پارامترهای Full Mode
CMD /usr/local/bin/mhrv-rs --mode full --port ${PORT}
