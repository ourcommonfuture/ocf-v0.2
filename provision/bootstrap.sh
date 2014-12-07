#!/bin/bash
# Need to pass home folder in the first arguments

# Time measurement
start=$(date +%s)

echo "=============================================="
echo "============= Start bootstraping ============="

echo "============= PERMISSIONS ============="
chmod 600 $1/.ssh/id_rsa

echo "============= End of bootstraping ============="
echo "==============================================="

# Time measurement
end=$(date +%s)

diff=$(( $end - $start ))

echo "================================="
echo "::: Elapsed Time: $diff seconds!!"
echo "================================="