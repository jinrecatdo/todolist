# Image chính thức Elasticsearch
FROM docker.elastic.co/elasticsearch/elasticsearch:8.11.1

# Cài plugin hỗ trợ tiếng Việt (nếu cần)
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu

# Expose port chuẩn của Elasticsearch
EXPOSE 9200 9300

# Thiết lập single-node & tắt security (dùng cho demo)
ENV discovery.type=single-node
ENV xpack.security.enabled=false

# Giới hạn RAM (heap memory)
ENV ES_JAVA_OPTS="-Xms256m -Xmx256m"

# Chạy Elasticsearch với host 0.0.0.0 và port 9200
CMD ["bin/elasticsearch", "-Ehttp.port=9200", "-Ehttp.host=0.0.0.0"]
