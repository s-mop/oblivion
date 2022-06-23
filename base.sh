sh -c "$(curl -fsSL https://raw.githubusercontent.com/s-mop/oblivion/main/install.sh)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/s-mop/oblivion/main/node_setup.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/s-mop/oblivion/main/mongs_setup.sh)"

bash mongs_setup.sh 172.17.54.2 172.17.54.3 172.17.54.6
