#!/bin/sh

SEP="==================================================================="

echo $SEP
echo "Installing pre-requisites"
yum -y install keyutils-libs-devel libcom_err-devel libselinux-devel libsepol-devel krb5-devel openssl-devel
echo $SEP

echo $SEP
echo "Building and installing Python 2.7"
mkdir -p tmp/build
cd tmp/build
wget https://www.python.org/ftp/python/2.7/Python-2.7.tgz
tar xvzf Python-2.7.tgz
cd Python-2.7
echo "Installing Python"
./configure
make altinstall
echo "alias python='/usr/local/bin/python2.7'" >> ~/.bashrc && alias python=/usr/local/bin/python2.7
echo $SEP

echo $SEP
echo "Installing Python setup and PIP utilities."
wget --no-check-certificate https://bootstrap.pypa.io/ez_setup.py -O - | python
wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py -O - | python

cp `find / -name python-sdk-1.0-src.zip` .

unzip python-sdk-1.0-src.zip
python setup.py install
echo $SEP

echo $SEP
echo "Testing for BMC CLM SDK..."
pip list | grep bmc
echo $SEP
cd ~/
echo $SEP
echo "Done!"
echo "Now type "clm" to test the SDK"
echo "Make sure CLM is running before using the SDK!"
echo $SEP
