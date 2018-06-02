apt-get update ;
apt-get install -y nginx ;
ufw allow 'Nginx HTTP' ;
ufw allow 'Nginx HTTPS' ;
apt-get install -y mysql-server ;
mysql_secure_installation

apt-get install -y php-fpm php-mysql php-simplexml composer
apt-get install -y zip unzip php-zip

adduser wp
usermod -aG sudo wp ;
usermod -aG www-data wp ;

su wp ;
mkdir ~/.ssh ;
ssh-keygen -t rsa -b 4096 ;
mkdir ~/repos ;
mkdir ~/data ;
mkdir ~/config ;
mkdir ~/dumps ;

mkdir ~/repos/memuller ;
cd ~/repos/memuller ;
git init ;
git config receive.denyCurrentBranch ignore ;

exit ;

cp /root/.ssh/authorized_keys /home/wp/.ssh/ ;
chown -R wp:wp /home/wp/.ssh ;
chmod -R 700 /home/wp/.ssh ;

apt-get install software-properties-common ;
add-apt-repository ppa:certbot/certbot ;
apt-get update ;
apt-get install python-certbot-nginx ;
certbot --nginx ;

cd /home/wp/
curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
chmod +x nodesource_setup.sh
./nodesource_setup.sh

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install -y nodejs make gcc g++ yarn
npm install -g check-node-version
rm nodesource_setup.sh

source ./setup/link.sh
source ./setup/perms.sh