#!/bin/bash

printf "PModel;Task;OpType;Opt;Timer;Time;LNum;AvTime;AbsErr;RelErr;InsCount;TaskPerf\n" >> result.csv
g++ -Wall -O3 -o main main.cpp foo.cpp
g++ -Wall -o pogr pogr.cpp
./main
proc_time1="$(cat time.txt)"
./main
proc_time2="$(cat time.txt)"
./main
proc_time3="$(cat time.txt)"
printf "$proc_time1 \n $proc_time2\n $proc_time3" >> time2.txt
g++ -Wall -o med_arif med_arif.cpp 
./med_arif
med_proc_time="$(cat time.txt)"
proc=$(lscpu|grep "Имя модели" | awk '{$1 = $2 = ""; print $0}')
printf "$proc;" >> result.csv
printf "Matrix;int;-O3;Simple Timer;" >> result.csv
printf "$proc_time1;1;" >> result.csv
printf "$med_proc_time;" >> result.csv
./pogr
med_arif=$(cat time.txt|grep "perl0" | awk '{print $2}')
printf "$med_arif;" >> result.csv
med_arif=$(cat time.txt|grep "perl0" | awk '{print $3}')
printf "$med_arif;\n" >> result.csv

proc=$(lscpu|grep "Имя модели" | awk '{$1 = $2 = ""; print $0}')
printf "$proc;" >> result.csv
printf "Matrix;int;-O3;Simple Timer;" >> result.csv
printf "$proc_time2;2;" >> result.csv
printf "$med_proc_time;" >> result.csv
med_arif=$(cat time.txt|grep "perl1" | awk '{print $2}')
printf "$med_arif;" >> result.csv
med_arif=$(cat time.txt|grep "perl1" | awk '{print $3}')
printf "$med_arif;\n" >> result.csv

proc=$(lscpu|grep "Имя модели" | awk '{$1 = $2 = ""; print $0}')
printf "$proc;" >> result.csv
printf "Matrix;int;-O3;Simple Timer;" >> result.csv
printf "$proc_time3;2;" >> result.csv
printf "$med_proc_time;" >> result.csv
med_arif=$(cat time.txt|grep "perl2" | awk '{print $2}')
printf "$med_arif;" >> result.csv
med_arif=$(cat time.txt|grep "perl2" | awk '{print $3}')
printf "$med_arif;" >> result.csv

valgrind --tool=callgrind --callgrind-out-file=callgrind.out ./main 
instr=$(cat callgrind.out | grep summary | awk '{print $2}')
taskperf=$(bc <<< "scale=2; $instr/$med_arif")
printf "$instr;" >> result.csv
printf "$taskperf;\n" >> result.csv

g++ -Wall -o main main.cpp foo.cpp
g++ -Wall -o pogr pogr.cpp
./main
proc_time1="$(cat time.txt)"
./main
proc_time2="$(cat time.txt)"
./main
proc_time3="$(cat time.txt)"
printf "$proc_time1 \n $proc_time2\n $proc_time3" >> time2.txt
g++ -Wall -o med_arif med_arif.cpp 
./med_arif
med_proc_time="$(cat time.txt)"
proc=$(lscpu|grep "Имя модели" | awk '{$1 = $2 = ""; print $0}')
printf "$proc;" >> result.csv
printf "Matrix;int;-O0;Simple Timer;" >> result.csv
printf "$proc_time1;1;" >> result.csv
printf "$med_proc_time;" >> result.csv
./pogr
med_arif=$(cat time.txt|grep "perl0" | awk '{print $2}')
printf "$med_arif;" >> result.csv
med_arif=$(cat time.txt|grep "perl0" | awk '{print $3}')
printf "$med_arif;\n" >> result.csv

proc=$(lscpu|grep "Имя модели" | awk '{$1 = $2 = ""; print $0}')
printf "$proc;" >> result.csv
printf "Matrix;int;-O0;Simple Timer;" >> result.csv
printf "$proc_time2;2;" >> result.csv
printf "$med_proc_time;" >> result.csv
med_arif=$(cat time.txt|grep "perl1" | awk '{print $2}')
printf "$med_arif;" >> result.csv
med_arif=$(cat time.txt|grep "perl1" | awk '{print $3}')
printf "$med_arif;\n" >> result.csv

proc=$(lscpu|grep "Имя модели" | awk '{$1 = $2 = ""; print $0}')
printf "$proc;" >> result.csv
printf "Matrix;int;-O0;Simple Timer;" >> result.csv
printf "$proc_time3;2;" >> result.csv
printf "$med_proc_time;" >> result.csv
med_arif=$(cat time.txt|grep "perl2" | awk '{print $2}')
printf "$med_arif;" >> result.csv
med_arif=$(cat time.txt|grep "perl2" | awk '{print $3}')
printf "$med_arif;" >> result.csv

valgrind --tool=callgrind --callgrind-out-file=callgrind.out ./main 
instr=$(cat callgrind.out | grep summary | awk '{print $2}')
taskperf=$(bc <<< "scale=2; $instr/$med_arif")
printf "$instr;" >> result.csv
printf "$taskperf;\n" >> result.csv