FROM gitpod/workspace-java-17

# 安装 sshd 和相关工具
RUN sudo apt-get update && \
    sudo apt-get install -y openssh-server && \
    sudo rm -rf /var/lib/apt/lists/* && \
    sudo mkdir -p /var/run/sshd
# 设置密码
RUN echo 'root:test' | sudo chpasswd
# 启用 supervisor 的 SSH 服务
RUN sudo mkdir -p /etc/supervisor/conf.d/
RUN sudo sh -c 'echo "supervisorctl start sshd" > /etc/supervisor/conf.d/supervisord.conf'

#RUN sudo echo 'supervisorctl start sshd' >> /etc/supervisor/conf.d/supervisord.conf
# 暴露 SSH 端口
EXPOSE 22
#RUN sudo apt install mysql-client -y
#RUN curl --proto '=https' --tlsv1.2 -sSf https://tiup-mirrors.pingcap.com/install.sh | sh
