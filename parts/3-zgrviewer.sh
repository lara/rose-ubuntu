set -e

#---------- install zgrviewer ----------
# 
# apt-get -y install graphviz
#
# #Download and untar the ZGRViewer distribution.
# cd ~/Downloads
# wget -O zgrviewer-0.10.0.zip https://sourceforge.net/projects/zvtm/files/zgrviewer/0.10.0/zgrviewer-0.10.0.zip/download
#
# cd ~/opt/
# unzip ~/Downloads/zgrviewer-0.10.0.zip
# cd zgrviewer-0.10.0
#
# # Edit it's "run.sh" script so that the ZGRV_HOME variable has the correct value.
# # The scripts/zgrviewerExampleScript has some additional java switches that are useful.
# # ZGRV_HOME=$HOME/opt/zgrviewer-0.10.0
# sed -i "/ZGRV_HOME=\./c\ZGRV_HOME=$HOME/opt/zgrviewer-0.10.0/" run.sh
#
# # Edit ~/.bashrc and add an alias that allows you to run ZGRViewer by typing "zgrviewer":
# # alias zgrviewer='$HOME/opt/zgrviewer-0.10.0/run.sh'
# sed -i '$ a alias zgrviewer='$HOME/opt/zgrviewer-0.10.0/run.sh'\n' $HOME/.bashrc
