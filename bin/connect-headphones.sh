#!/bin/bash

MAC="00:A4:1C:84:4B:27"  # Замени на MAC твоих наушников

echo "Подключаем наушники $MAC..."

bluetoothctl << EOF
power on
connect $MAC
exit
EOF

echo "Готово."

