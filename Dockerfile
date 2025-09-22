# Dùng image chính thức của Elasticsearch
FROM docker.elastic.co/elasticsearch/elasticsearch:8.11.1

# Cài thêm plugin nếu cần, ví dụ analysis-icu
# RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu
# Expose port 9200 để Render detect
EXPOSE 9200 9300

# Thiết lập node single-node, tắt security để deploy nhanh
ENV discovery.type=single-node
ENV xpack.security.enabled=false

# Command khởi động Elasticsearch
CMD ["bin/elasticsearch", "-Ehttp.port=${PORT:9200}", "-Ehttp.host=0.0.0.0"]

