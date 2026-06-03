# Docker 基础服务安装快捷脚本

## 1.安装docker

docker官方提供了傻瓜式安装脚本，为你做好所有工作，免去了手动安装的繁琐。

执行一下命令

```shell
curl -fsSL https://get.docker.com | bash -s docker
```

可在此命令后附带--mirror参数设置镜像源，以提高国内服务器下载docker的速度

如使用阿里云镜像:

```shell
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```
