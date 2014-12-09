#!/bin/bash
# Need to pass home folder in the first arguments

# Time measurement
start=$(date +%s)

echo "=============================================="
echo "============= Start bootstraping ============="

echo "============= PERMISSIONS ============="
chmod 600 $1/.ssh/id_rsa

cd /tmp
echo "============= Update ============="
sudo apt-get -qq update

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

# echo "============= RUBY (via RVM) ============="
# curl -sSL https://get.rvm.io | bash -s stable
# source /usr/local/rvm/scripts/rvm
# echo "source $1/.rvm/scripts/rvm" >> $1/.bashrc

# echo "============= NODE ============="
# sudo add-apt-repository ppa:chris-lea/node.js
# sudo apt-get update
# sudo apt-get -y -q install nodejs

# echo "============= RAILS ============="
# gem install rails

# echo "============= POSTGRES ============="
# sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
# wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
# apt-get -y -q install postgresql-common
# apt-get -y -q install postgresql-9.3 libpq-dev
# apt-get install -y -q postgresql postgresql-contrib
# sudo -u postgres createuser -P -s vagrant

# echo "============= ALIASES ============="

# echo "
# alias commit='git commit -m'" > /home/vagrant/.bash_aliases

# echo "
# cd /vagrant" >> /home/vagrant/.zshrc

echo "============= End of bootstraping ============="
echo "==============================================="

# Time measurement
end=$(date +%s)

diff=$(( $end - $start ))

echo "================================="
echo "::: Elapsed Time: $diff seconds!!"
echo "================================="