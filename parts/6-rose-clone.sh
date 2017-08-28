set -e

cd ~/
git clone https://github.com/rose-compiler/rose-develop --depth 1
cd rose-develop
./build
cd ..
