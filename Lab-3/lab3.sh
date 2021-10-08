#!/bin/bash

printf "MemoryType;BlockSize;ElementType;BufferSize;LaunchNum;Timer;WriteTime;AverageWriteTime;WriteBandwidth;AbsError(write);RelError(write);ReadTime;AverageReadTime;ReadBandwidthAbsError(read);RelError(read);\n" >> result.csv

cmake -S . -B build/Debug -DCMAKE_BUILD_TYPE=Debug
cmake --build build/Debug

./build/Debug/main Write SSD/HDD 1000
Write_time1="$(cat time.txt)"

./build/Debug/main Write SSD/HDD 1000
Write_time2="$(cat time.txt)"

./build/Debug/main Write SSD/HDD 1000
Write_time3="$(cat time.txt)"

./build/Debug/main Read SSD/HDD 1000
Read_time1="$(cat time.txt)"

./build/Debug/main Read SSD/HDD 1000
Read_time2="$(cat time.txt)"

./build/Debug/main Read SSD/HDD 1000
Read_time3="$(cat time.txt)"

med_time_read=$(bc <<< "scale=5; ($Read_time1+$Read_time2+$Read_time3)/3")
AbsError_read=$(bc <<< "scale=5; ($Read_time1/$med_time_read)")
RelError_read=$(bc <<< "scale=5; ($med_time_read/$Read_time1)")

med_time_write=$(bc <<< "scale=5; ($Write_time1+$Write_time2+$Write_time3)/3")
WriteBandwidth_write=$(bc <<< "scale=5; ((1000*4)/$med_time_write)")
AbsError_write=$(bc <<< "scale=5; ($Write_time1/$med_time_write)")
RelError_write=$(bc <<< "scale=5; ($med_time_write/$Write_time1)")
printf "SSD;4MB;double;8 byte;1;Simple Timer;$Write_time1;0$med_time_write;$WriteBandwidth_write;$AbsError_write;0$RelError_write;$Read_time1;0$med_time_read;$AbsError_read;0$RelError_read\n" >> result.csv

# --------------------------------

med_time_read=$(bc <<< "scale=5; ($Read_time1+$Read_time2+$Read_time3)/3")
AbsError_read=$(bc <<< "scale=5; ($Read_time2/$med_time_read)")
RelError_read=$(bc <<< "scale=5; ($med_time_read/$Read_time2)")

med_time_write=$(bc <<< "scale=5; ($Write_time1+$Write_time2+$Write_time3)/3")
WriteBandwidth_write=$(bc <<< "scale=5; ((1000*4)/$med_time_write)")
AbsError_write=$(bc <<< "scale=5; ($Write_time2/$med_time_write)")
RelError_write=$(bc <<< "scale=5; ($med_time_write/$Write_time2)")
printf "SSD;4MB;double;8 byte;2;Simple Timer;$Write_time2;0$med_time_write;$WriteBandwidth_write;$AbsError_write;0$RelError_write;$Read_time1;0$med_time_read;$AbsError_read;0$RelError_read\n" >> result.csv

# --------------------------------------------

med_time_read=$(bc <<< "scale=5; ($Read_time1+$Read_time2+$Read_time3)/3")
AbsError_read=$(bc <<< "scale=5; ($Read_time2/$med_time_read)")
RelError_read=$(bc <<< "scale=5; ($med_time_read/$Read_time2)")

med_time_write=$(bc <<< "scale=5; ($Write_time1+$Write_time2+$Write_time3)/3")
WriteBandwidth_write=$(bc <<< "scale=5; ((1000*4)/$med_time_write)")
AbsError_write=$(bc <<< "scale=5; ($Write_time3/$med_time_write)")
RelError_write=$(bc <<< "scale=5; ($med_time_write/$Write_time3)")
printf "SSD;4MB;double;8 byte;3;Simple Timer;$Write_time3;0$med_time_write;$WriteBandwidth_write;$AbsError_write;0$RelError_write;$Read_time1;0$med_time_read;$AbsError_read;0$RelError_read\n" >> result.csv

# ------------------------OPR-------------------------------------
./build/Debug/main Write OPR 1000
Write_time1="$(cat time.txt)"

./build/Debug/main Write OPR 1000
Write_time2="$(cat time.txt)"

./build/Debug/main Write OPR 1000
Write_time3="$(cat time.txt)"

./build/Debug/main Read OPR 1000
Read_time1="$(cat time.txt)"

./build/Debug/main Read OPR 1000
Read_time2="$(cat time.txt)"

./build/Debug/main Read OPR 1000
Read_time3="$(cat time.txt)"

med_time_read=$(bc <<< "scale=5; ($Read_time1+$Read_time2+$Read_time3)/3")
AbsError_read=$(bc <<< "scale=5; ($Read_time1/$med_time_read)")
RelError_read=$(bc <<< "scale=5; ($med_time_read/$Read_time1)")

med_time_write=$(bc <<< "scale=5; ($Write_time1+$Write_time2+$Write_time3)/3")
WriteBandwidth_write=$(bc <<< "scale=5; ((1000*4)/$med_time_write)")
AbsError_write=$(bc <<< "scale=5; ($Write_time1/$med_time_write)")
RelError_write=$(bc <<< "scale=5; ($med_time_write/$Write_time1)")
printf "OPR;4MB;double;8 byte;1;Simple Timer;$Write_time1;0$med_time_write;$WriteBandwidth_write;$AbsError_write;0$RelError_write;$Read_time1;0$med_time_read;$AbsError_read;0$RelError_read\n" >> result.csv

# --------------------------------

med_time_read=$(bc <<< "scale=5; ($Read_time1+$Read_time2+$Read_time3)/3")
AbsError_read=$(bc <<< "scale=5; ($Read_time2/$med_time_read)")
RelError_read=$(bc <<< "scale=5; ($med_time_read/$Read_time2)")

med_time_write=$(bc <<< "scale=5; ($Write_time1+$Write_time2+$Write_time3)/3")
WriteBandwidth_write=$(bc <<< "scale=5; ((1000*4)/$med_time_write)")
AbsError_write=$(bc <<< "scale=5; ($Write_time2/$med_time_write)")
RelError_write=$(bc <<< "scale=5; ($med_time_write/$Write_time2)")
printf "OPR;4MB;double;8 byte;2;Simple Timer;$Write_time2;0$med_time_write;$WriteBandwidth_write;$AbsError_write;0$RelError_write;$Read_time1;0$med_time_read;$AbsError_read;0$RelError_read\n" >> result.csv

# --------------------------------------------

med_time_read=$(bc <<< "scale=5; ($Read_time1+$Read_time2+$Read_time3)/3")
AbsError_read=$(bc <<< "scale=5; ($Read_time2/$med_time_read)")
RelError_read=$(bc <<< "scale=5; ($med_time_read/$Read_time2)")

med_time_write=$(bc <<< "scale=5; ($Write_time1+$Write_time2+$Write_time3)/3")
WriteBandwidth_write=$(bc <<< "scale=5; ((1000*4)/$med_time_write)")
AbsError_write=$(bc <<< "scale=5; ($Write_time3/$med_time_write)")
RelError_write=$(bc <<< "scale=5; ($med_time_write/$Write_time3)")
printf "OPR;4MB;double;8 byte;3;Simple Timer;$Write_time3;0$med_time_write;$WriteBandwidth_write;$AbsError_write;0$RelError_write;$Read_time1;0$med_time_read;$AbsError_read;0$RelError_read\n" >> result.csv
