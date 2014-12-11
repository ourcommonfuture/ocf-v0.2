# Time measurement
start=$(date +%s)

echo "================================================"
echo "============= Start rails app init ============="

cd $1
source /vagrant/provision/data/id_pg.sh

echo "============= Bundle install ============="
bundle install

echo "============= Rake create ============="
rake db:create

echo "============= Rake create ============="
rake db:migrate

echo "============= Rake seed ============="
rake db:seed


echo "============= Finished rails app init ============="
echo "==================================================="

# Time measurement
end=$(date +%s)

diff=$(( $end - $start ))

echo "================================="
echo "::: Elapsed Time: $diff seconds!!"
echo "================================="