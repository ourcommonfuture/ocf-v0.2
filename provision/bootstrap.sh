#!/bin/bash
# Need to pass home folder in the first arguments

# Time measurement
start=$(date +%s)

echo "=============================================="
echo "============= Start bootstraping ============="

echo "============= PERMISSIONS & SSH managment ============="
chmod 600 $1/.ssh/id_rsa
# start the ssh-agent in the background
eval "$(ssh-agent -s)"
# then add your ssh key
ssh-add $1/.ssh/id_rsa

echo "============= apt-get add & update ============="
add-apt-repository ppa:chris-lea/node.js
apt-get -qq update

echo "============= MISCs ============="
apt-get install -y -qq libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

echo "============= GIT ============="
apt-get install -y -qq git

echo "============= ZSH ============="
# Install zsh
apt-get install -y -qq zsh

# Clone oh-my-zsh
if [ ! -d $1/.oh-my-zsh ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git $1/.oh-my-zsh
fi

# Create a new zsh configuration from the provided template
cp $1/.oh-my-zsh/templates/zshrc.zsh-template $1/.zshrc

# Customize theme
sed -i -e 's/ZSH_THEME=".*"/ZSH_THEME="bira"/' $1/.zshrc

# add aliases
sed -i -e 's/# Example aliases/source ~\/.bash_aliases/gi' $1/.zshrc

# Set zsh as default shell
chsh -s /bin/zsh vagrant

chown -R vagrant:vagrant $1/.oh-my-zsh

echo "============= RUBY (via RVM) ============="
pwd
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --path $1/.rvm
source $1/.rvm/scripts/rvm
echo "source $1/.rvm/scripts/rvm" >> $1/.zshrc
rvm install 2.1.3
rvm use 2.1.3 --default

echo "============= NODE ============="
apt-get -y -qq install nodejs

echo "============= RAILS ============="
gem install rails

echo "============= POSTGRES ============="
# Adding Postgress id to the environement vars
source /vagrant/provision/data/id_pg.sh
cat /vagrant/provision/data/id_pg.sh >> $1/.bashrc

apt-get install -y postgresql postgresql-contrib
sudo -u postgres psql -c "CREATE USER $PGUSER WITH PASSWORD '$PGPASSWORD';"

# OLD
# sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
# wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
# apt-get -y -qq install postgresql-common
# apt-get -y -qq install postgresql-9.3 libpq-dev
# apt-get install -y -qq postgresql postgresql-contrib
# sudo -u postgres createuser -P -s $PGUSER

echo "============= ALIASES ============="

echo "
alias commit='git commit -m'" > /home/vagrant/.bash_aliases

echo "
cd /vagrant" >> /home/vagrant/.zshrc

echo "============= End of bootstraping ============="
echo "==============================================="

# Time measurement
end=$(date +%s)

diff=$(( $end - $start ))

echo "================================="
echo "::: Elapsed Time: $diff seconds!!"
echo "================================="