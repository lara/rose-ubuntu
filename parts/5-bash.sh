set -e

#---------------------------

# For various analysis algorithms that use cryptographic functions
# apt-get -y install libssl-dev libgcrypt11-dev

#---------------------------

# For parsing XML files in certain tools such as roseHPCT and BinaryContextLookup.
# apt-get -y install libxml2-dev

#---------------------------

# apt-get -y install libdwarf-dev

#---------- cleanup -----------

cd ~/
rm -r ~/Downloads/*
