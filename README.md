# GNS3 Docker

A dockerfile for gns3-server, can run gns3 with remote-server mode. You can deploy it on `wsl` or `vps`.



**What is the different between local-server, vm (vmware or others) and remote-server?**

- GNS3 is C/S arch，`gns3-all-in-one.exe` is just a client gui installer
- if you use local-server,   `gns3-server.exe` will start on you local OS
- if you use vm, `gns3` will use call `hyperviser` to open vm, and you can simple regard vm as a `ubuntu` images with running `gns3-server` 
- if you use remote-server, it is just like vm server, but you can deploy it simple and much simpler!





### How to use?

**First of all**, you need to build a `gns3-server` image，the dockerfile is provided in `/asset` folder.

There are two ways to build it

- ~~~shell
  #first way
  git clone https://github.com/iamNCJ/gns3-docker
  cd /assets
  
  # -t set a tag for later to distinguish
  # -f use the specified dockerfile
  docker build . -t gns3-server:2.2.25 -f gns.Dockerfile
  ~~~

- If the first way you meet some weird errors, you can use aliyun ACR

  - first create a repo at [code.aliyun.com](http://code.aliyun.com)，just put a `Dockerfile` file at the root pos with the contents same as  `gns.Dockerfile`

  - go to [here](https://cr.console.aliyun.com/cn-hangzhou/instance/repositories)，click **创建镜像仓库**, and  choose the source code register with **云code**，then set ![image-20211003150605678](https://pic.raynor.top/images/2021/10/03/image-20211003150605678.png)

    ![image-20211003150738025](https://pic.raynor.top/images/2021/10/03/image-20211003150738025.png)

  - then click

    ![image-20211003150811945](https://pic.raynor.top/images/2021/10/03/image-20211003150811945.png)

  - after build success, you can use this to pull the images

    ~~~bash
    docker pull registry.cn-hangzhou.aliyuncs.com/****/gns3_server:[镜像版本号] 
    ~~~

- use `docker images` to check whether build success!



**Second**,  you need edit the `Dockerfile` 

~~~shell

cd /path/to/gns3-docker
vim docker-compose.yaml

##change the 
 gns3-server:
    image: registry.cn-shanghai.aliyuncs.com/ncj/gns3:2.2.17
    
## to
 gns3-server:
 	image: #the tag you build at the first step! maybe gns3-server:2.2.25 or registry.cn-shanghai.aliyuncs.com/****/****:0.0.1
~~~

then just use follow command to start it!

```bash
docker-compose up -d
```





### Tips:

- if you use VPS, don't forget to open firewall with `3080` port( if you don't change it )
- if you use WSL, you can visit `localhost:3080` to check whether deply success，otherwise you need to visit `http://ip:3080` to check



### How to use GNS3-client?

- go to https://github.com/GNS3/gns3-gui/releases/ to download the lastest [GNS3-2.2.25-all-in-one.exe](https://github.com/GNS3/gns3-gui/releases/download/v2.2.25/GNS3-2.2.25-all-in-one.exe)
- install it with default setting

![image-20211003151927366](https://pic.raynor.top/images/2021/10/03/image-20211003151927366.png)



- if you have already install it, just uninstall and redo(XD

