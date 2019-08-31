PHP_VERSION=7.3

DB_NAME="project"
DB_USER="admin"
DB_PASSWORD="secret"

TellMe() {
  echo ""
  echo ""
  echo "==============$1=============="
  echo ""
  echo ""
}

Update() {
  echo ""
  echo ""
  TellMe "Updating"
  echo ""
  echo ""
  sudo apt-get -y update
  sudo apt-get -y upgrade
  echo ""
}

Update

TellMe "Adding php repo"
sudo add-apt-repository -y ppa:ondrej/php

Update

TellMe "Installing common tools"
sudo apt install -y software-properties-common unzip git build-essential

TellMe "installing PHP v$PHP_VERSION"
sudo apt-get install -y php${PHP_VERSION}-fpm
sudo apt-get -y install php${PHP_VERSION} php${PHP_VERSION}-common php${PHP_VERSION}-cli php${PHP_VERSION}-mysql php${PHP_VERSION}-gd php${PHP_VERSION}-xml php-imagick php${PHP_VERSION}-dev php${PHP_VERSION}-imap php${PHP_VERSION}-soap php${PHP_VERSION}-zip php${PHP_VERSION}-intl php${PHP_VERSION}-curl php${PHP_VERSION}-mbstring php${PHP_VERSION}-opcache php${PHP_VERSION}-json
sudo service php${PHP_VERSION}-fpm restart
Update

TellMe "Installing nginx"
sudo apt-get install -y nginx
sudo rm /etc/nginx/sites-available/default
sudo chmod -R 777 /etc/nginx/sites-available/
sudo mv /portfolio/default /etc/nginx/sites-available/
sudo service nginx restart

Update
echo "==============Installing mysql=============="
sudo apt-get install -y debconf-utils
sudo debconf-set-selections <<<'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<<'mysql-server mysql-server/root_password_again password root'
sudo apt-get install -y mysql-server
mysql -uroot -proot -e "CREATE DATABASE $DB_NAME"
mysql -uroot -proot -e "grant all privileges on $DB_NAME.* to '$DB_USER'@'localhost' identified by '$DB_PASSWORD'"
