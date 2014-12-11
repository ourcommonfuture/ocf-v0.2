# Time measurement
start=$(date +%s)

echo "================================================"
echo "============= Start rails app init ============="

cd $1
bundle install
rake db:create db:migrate db:seed

echo "============= Finished rails app init ============="
echo "==================================================="

# Time measurement
end=$(date +%s)

diff=$(( $end - $start ))

echo "================================="
echo "::: Elapsed Time: $diff seconds!!"
echo "================================="