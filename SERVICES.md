# Docker Compose 服务与端口清单

> 统一密码：`SunDaha_8322368`
> XXL-JOB accessToken：`sundaha123456`

## 容器与端口总览

| 服务 | 容器名 | 端口 | 类型 | 说明 |
|------|--------|------|------|------|
| Redis | redis | 6379 | 🔌 业务 | 缓存，密码认证 |
| MySQL | mysql-8 | 3306 | 🔌 业务 | 关系库 |
| PostgreSQL | postgres | 5432 | 🔌 业务 | 关系库（pgvector） |
| MongoDB | mongodb | 27017 | 🔌 业务 | 文档库，auth |
| Elasticsearch | elasticsearch | 9200 | 🔌 业务 | REST API |
| Elasticsearch | elasticsearch | 9300 | 🔒 内部 | transport，单节点不用 |
| MinIO | minio | 9000 | 🔌 业务 | S3 对象存储 API |
| MinIO | minio | 9001 | 🖥️ 后台 | 控制台 |
| Milvus | milvus-standalone | 19530 | 🔌 业务 | 向量库 gRPC |
| Milvus | milvus-standalone | 9091 | 🔒 内部 | healthz 探活 |
| milvus-etcd | milvus-etcd | — | 🔒 内部 | 不映射，容器内 2379 |
| Attu | attu | — | 🔒 内部 | 不映射，经 caddy 反代 |
| RabbitMQ | rabbitmq | 5672 | 🔌 业务 | AMQP |
| RabbitMQ | rabbitmq | 15672 | 🖥️ 后台 | 管理界面 |
| Kafka | kafka | 9094 | 🔌 业务 | 宿主机外部访问 |
| Kafka | kafka | 9092/9093 | 🔒 内部 | 容器内 / controller |
| Zookeeper | zookeeper | 2181 | 🔌 业务 | 协调服务（可选启动） |
| Kibana | kibana | 5601 | 🖥️ 后台 | ES 可视化 |
| Kafka UI | kafka-ui | 8085 | 🖥️ 后台 | Kafka 可视化 |
| XXL-JOB | xxl-job-admin | 8080 | 🖥️ 后台 | 任务调度控制台 |
| Attu Proxy | attu-proxy | 18000 | 🖥️ 后台 | Attu UI 反代（Basic Auth） |

---

## 人类可访问的后台地址（浏览器）

| 服务 | URL | 账号 |
|------|-----|------|
| Kibana | http://localhost:5601 | service token（自动生成） |
| MinIO 控制台 | http://localhost:9001 | admin / SunDaha_8322368 |
| RabbitMQ 管理 | http://localhost:15672 | admin / SunDaha_8322368 |
| XXL-JOB | http://localhost:8080/xxl-job-admin | accessToken: sundaha123456 |
| Kafka UI | http://localhost:8085 | admin / SunDaha_8322368 |
| Attu UI | http://localhost:18000 | attuadmin / 随机密码（attu/.env） |

---

## 业务数据端口（程序连接）

| 服务 | 连接地址 |
|------|----------|
| Redis | `localhost:6379` |
| MySQL | `localhost:3306` |
| PostgreSQL | `localhost:5432` |
| MongoDB | `localhost:27017` |
| Elasticsearch | `http://localhost:9200` |
| MinIO API | `http://localhost:9000` |
| Milvus | `localhost:19530` |
| RabbitMQ | `localhost:5672` |
| Kafka | `localhost:9094` |
| Zookeeper | `localhost:2181` |

---

## 端口类型说明

- 🔌 **业务**：程序/服务连接使用的数据端口
- 🖥️ **后台**：浏览器访问的管理界面 / 控制台
- 🔒 **内部**：仅容器间通信，不暴露宿主机
