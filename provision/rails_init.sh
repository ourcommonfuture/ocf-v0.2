# Time measurement
start=$(date +%s)

echo "================================================"
echo "============= Start rails app init ============="

cd $1
source provision/data/id_pg.sh

echo "============= Bundle install ============="
bundle install

echo "============= Secret creation ============="
echo 'export SECRET_KEY_BASE='$(rake secret) > provision/data/rake_secret.sh
cat /vagrant/provision/data/rake_secret.sh >> $2/.zshrc
cat /vagrant/provision/data/rake_secret.sh >> $2/.bashrc

echo "============= NO DB init ============="
>&2 echo "Don't forget to init you database by running "
>&2 echo "this command once your are connected in ssh:"
>&2 echo " "
>&2 echo "	rake db:create db:migrate db:seed"
>&2 echo " "
>&2 echo "See README.md for more information"
# rake db:create db:migrate db:seed


echo "============= Finished rails app init ============="
echo "==================================================="

# Time measurement
end=$(date +%s)

diff=$(( $end - $start ))

echo "================================="
echo "::: Elapsed Time: $diff seconds!!"
echo "================================="