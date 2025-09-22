# Dockerfile cho Redis
FROM redis:7-alpine

# Mở cổng 6379
EXPOSE 6379

# Dữ liệu Redis sẽ được mount từ volume của Render
VOLUME /data
