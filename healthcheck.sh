#!/bin/bash

echo "........................................................."
echo "Chequeando si el HUB está listo para ejecutar las pruebas"
echo "........................................................."

while [ "$(curl -s http://162.222.178.134:4444/status | jq -r .value.nodes[0].availability)" != "UP" ]
do
        sleep 10
done

java -cp selenium-docker.jar:selenium-docker-tests.jar:lib/* -DBROWSER=162.222.178.134 -DHUB_HOST=$HUB_HOST org.testng.TestNG $MODULE
