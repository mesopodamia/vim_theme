#!/bin/bash
echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
    sudo apt-get install -y vim python-setuptools python-dev git
elif which yum >/dev/null; then
    sudo yum install -y gcc vim git python-setuptools python-devel  
fi

##Add HomeBrew support on Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim git
fi
if [ -d ~/vim ]; then
    mv -f ~/vim ~/vim_old
fi
if [ -d /tmp/vim_theme ]; then
    rm -rf /tmp/vim_theme;
fi
cd /tmp/ && git clone https://github.com/mesopodamia/vim_theme.git
if [ -f ~/.vimrc ]; then
    mv -f ~/.vimrc ~/.vimrc_old
fi
mv -f /tmp/vim_theme/vimrc ~/.vimrc
echo "安装完毕将自动退出" >> /tmp/vim_install.log
echo "请耐心等待" >> /tmp/vim_install.log
echo "安装完成"
