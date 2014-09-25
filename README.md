# Jenkins

Jenkins 作为一个持续集成工具，Jenkins以开源，强大的插件而流行。

# Jenkins 安装使用

默认使用了docker的方式打包了Jenkins最新版安装，安装及使用都很方便。

### 使用

	docker run -d -t excalibur/jenkins

所有的数据将会持久化到`/var/jenkins_home`，包括插件和配置。如果你想持久化到数据，那可以使用如下命令：

	docker run --name myjenkins -p 8080:8080 -v /var/jenkins_home excalibur/jenkins
	
有时候我们需要持久化数据到host主机，你可以把对应的数据设置到你需要持久化的路径，比如`/tmp/jenkins`：

	docker run -p 8080:8080 -v /tmp/jenkins:/var/jenkins_home excalibur/jenkins

> **注意**: 因为jenkins运行的时候是以jenkins用户运行，所以你需要确保你设置的路径，比如：`/tmp/jenkins`jenkins用户拥有权限。

### 或者简单获取镜像

使用github构建
	
	docker build -t excalibur/jenkins github.com/excalibur/jenkins

或者简单的获取镜像

	docker pull excalibur/jenkins

### 备份数据

如果设置-v 方式可以直接备份对应路径，如果没有设置那么使用`docker cp $ID:/var/jenkins_home`进行数据提取。

### 增加构建机器

您可以在主机运行构建，如果你想从属服务器进行构建那么：确保你映射了端口：`-p 50000:50000` - 这将用来当一个连接代理。 

[这里]是一些例子，你最好可以尝试一下。

### 更新

所有数据都在`/var/jenkins_home`中，你需要怎么使用，或者更新对应修改就是。如果设置了`-v`的那就更加方便了，在host主机对应的路径修改后，重启Jenkins就可以了。

### 安装插件

为了简单起见提供了常用插件产考，你可以直接下载到对应路径：

 * hipchat.hpi
 * greenballs.hpi
 * credentials.hpi
 * ssh-credentials.hpi
 * ssh-agent.hpi
 * git-client.hpi
 * git.hpi
 * github.hpi
 * github-api.hpi
 * ghprb.hpi
 * github-oauth.hpi
 * scm-api.hpi
 * postbuild-task.hpi

因为权限问题，使用你最好使用：

	docker run -it --rm --link sleepy_morse:sleepy_morse -v /tmp/jenkins:/var/jenkins_home excalibur/jenkins bash

`sleepy_morse`请换成你对应的容器名称。然后进入`/var/jenkins_home`进行下载插件。

安装方式，进入对应的plugins目录，如:`/tmp/jenkins/plugins`进行获取插件，然后重启Jenkins

	wget --no-check-certificate http://updates.jenkins-ci.org/latest/cobertura.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/hipchat.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/greenballs.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/instant-messaging.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/ircbot.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/postbuild-task.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/copy-to-slave.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/credentials.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-credentials.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/ssh-agent.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/git-client.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/git.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/github.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/github-api.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/github-oauth.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/ghprb.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/scm-api.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/swarm.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/envinject.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/parameterized-trigger.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/token-macro.hpi && \
	wget --no-check-certificate http://updates.jenkins-ci.org/latest/build-name-setter.hpi 
