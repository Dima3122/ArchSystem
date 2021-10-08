#!/bin/bash
echo -e -n "Дaта; \t\t\t\t\t\t"; date;
echo -e -n "Имя учетной записи:\t\t\t\t"; whoami;
echo -e -n "Доменное имя ПК:\t\t\t\t"; hostname;
echo "Процессор:"
echo -e -n "\tМодель:\t\t\t\t\t"; lscpu | grep "Имя модели:"| awk '{print $3,$4,$5,$6,$7,$8}';
echo -n -e "\tАрхитектура:\t\t\t\t"; lscpu | grep "Архитектура:"| awk '{print $2}'
echo -e -n "\tТактовая частота:\t\t\t"; lscpu | grep "Имя модели:"| awk '{print $8}';
echo -e -n "\tКоличество ядер:\t\t\t"; lscpu | grep "Ядер на сокет:"| awk '{print $4}';
echo -e -n "\tКоличество потоков на одно ядро:\t"; lscpu | grep "Потоков на ядро:"| awk '{print $4}';
echo "Оперативная память";
echo -e -n "\tВсего:\t\t\t\t\t"; cat /proc/meminfo | grep "MemTotal:"| awk '{print $2$3}';
echo -e -n "\tДоступно:\t\t\t\t"; cat /proc/meminfo | grep "MemFree:"| awk '{print $2$3}';
echo "Жесткий диск:"
echo -e -n "\tВсего:\t\t\t\t\t"; free | grep "Память"| awk '{print $2}';
echo -e -n "\tДоступно:\t\t\t\t"; free | grep "Память"| awk '{print $4}';
echo -e -n "\tСмонтированно в корневую директорию:\t"; free | grep "Память"| awk '{print $2}';
echo -e -n "\tSWAP всего:\t\t\t\t"; free | grep "Подкачка"| awk '{print $2}';
echo -e -n "\tSWAP доступно:\t\t\t\t"; free | grep "Подкачка"| awk '{print $4}';
printf "Сетевые интерфейсы: \n"

count=$(ip link |wc -l)
count=$((count/2))

printf "\tКолличество сетевых интерфейсов - %s\n" $count

echo -e "\t№\tИмя сетевого интерфейса\t\tMAC адрес\t\tIP адрес\t\tСкорость соединения"

for i in $(seq 1 "$count")
do
    printf "\t%s\t" $i
    printf "%-32s" $(ifconfig -s | awk -v i=$i 'FNR==i+1 {print $1}') 
    printf "%-24s" $(ip link | grep  'link' | awk -v i=$i 'FNR==i {print $2}')
    printf "%-24s" $(ip address | grep -w 'inet' | awk -v i=$i 'FNR==i {print $2}')
    printf "%-10s\n" $(sudo -S ethtool $(ifconfig -s | awk -v i=$i 'FNR==i+1 {print $1}')  | grep Speed | awk '{print $2}')
done