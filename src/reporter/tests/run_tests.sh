#!/usr/bin/env bash

docker build -t quantumleap ../../../

docker-compose up -d
sleep 12

echo "print the value of env varibales"
echo $ORION_URL
echo $QL_URL

docker run -ti --rm --network tests_reportertests quantumleap pytest reporter/tests
r=$?

docker-compose down -v
exit $r
