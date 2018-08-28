
1, 编译csm:
sudo apt install build-essential cmake libgs-dev libcairo2-dev
git clone https://github.com/AndreaCensi/csm.git
mkdir csm/out
cd csm/out
cmake .. && make && sudo make install


2, odom_ws

sudo apt install libeigen3-dev
