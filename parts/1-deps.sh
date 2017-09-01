set -e

# A script to install ROSE within a virtual machine based on Ubuntu 16.05.
# The content is described in https://en.wikibooks.org/wiki/ROSE_Compiler_Framework/Virtual_Machine_Image#V3

apt-get update
apt-get -y upgrade
apt-get -y install git wget build-essential libtool automake flex bison python3-dev
mkdir ~/Downloads

#---------- change gcc to 4.9.3 ----------

apt-get -y install gcc-4.9 g++-4.9 gfortran-4.9
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100
# update-alternatives --install /usr/bin/gfortran gfortran /usr/bin/gfortran-4.9 100

# #---------- install jdk ----------
#
# # download jdk-7u51-linux-x64.tar.gz
#
# cd ~/Downloads
# wget --no-cookies \
# --no-check-certificate \
# --header "Cookie: oraclelicense=accept-securebackup-cookie" \
# "http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.tar.gz" \
# -O jdk-7u51-linux-x64.tar.gz
# # then
# #tar -xzvf jdk-7-linux-x64.tar.gz
#
# mkdir -p ~/opt/jvm
# cd ~/opt/jvm
# tar -xzvf ~/Downloads/jdk-7u51-linux-x64.tar.gz
#
# PATH=$HOME/opt/jvm/jdk1.7.0_51/bin:$PATH
# LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/opt/jvm/jdk1.7.0_51/jre/lib/amd64/server:$HOME/opt/jvm/jdk1.7.0_51/lib
# export PATH LD_LIBRARY_PATH
#
# # add to .bashrc
# sed -i '$ a export PATH=$HOME/opt/jvm/jdk1.7.0_51/bin:$PATH\nexport LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/opt/jvm/jdk1.7.0_51/jre/lib/amd64/server:$HOME/opt/jvm/jdk1.7.0_51/lib\n' $HOME/.bashrc

#open new terminal
#check that javac -version says javac 1.7.0_51
