## ubuntu 安装 mssql server

curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list | sudo tee /etc/apt/sources.list.d/mssql-server.list

sudo apt-get update
sudo apt-get install -y mssql-server
