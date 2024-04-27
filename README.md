# 打包了常用工具的镜像

## 镜像说明

### kubectl-envsubst

打包了 kubectl 和 envsubst(gettext) 等，用于向 K8s 集群部署应用时动态替换 yaml 文件中的环境变量。

### node-jq

打包了 node 和 jq(一个解析 JSON 的命令行工具) 等，用于编译和发布 NPM 包，并在发布前可用 jq 工具动态处理 package.json 中 version 的值。

## 构建镜像

```bash
# Build and push docker image.
cd kubectl-envsubst
docker build -t bbxx111/kubectl-envsubst:v1.28.9 -f kubectl-envsubst.Dockerfile .
docker push bbxx111/kubectl-envsubst:v1.28.9

docker build -t bbxx111/node-jq:20-alpine -f node-jq.Dockerfile .
docker push bbxx111/node-jq:20-alpine
```
