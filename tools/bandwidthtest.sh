yum -y install qperf
server#qperf
client#qperf -t 10 --use_bits_per_sec 172.17.54.2 tcp_bw
client#qperf -t 10 --use_bits_per_sec 172.17.54.2 tcp_lat
