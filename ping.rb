require "descriptive_statistics"

def block_into_small_arrays(input)
  arr = []
  input.each_line do |line|
    arr << line
  end
  arr
end

def find_time_in_each_line(array)
  data_set = []
  array.each do |line|
    break unless time_without_time = line.match(/time=\d*.\d*/)
    time_with_time = time_without_time[0].gsub("time=","")
    data_set << time_with_time.to_f
  end
  data_set
end

def compute_dataset(data)
  modified_data = block_into_small_arrays(data)
  find_time_in_each_line(modified_data)
end

def print_stats(array)
  puts "MIN: #{array.min}"
  puts "MAX: #{array.max}"
  puts "MEAN #{array.mean}"
  puts "MEDIAN: #{array.median}"
  puts "ST_DEV: #{array.standard_deviation}"
end

data = "64 bytes from 91.121.23.186: icmp_seq=0 ttl=53 time=90.294 ms
64 bytes from 91.121.23.186: icmp_seq=1 ttl=53 time=89.307 ms
64 bytes from 91.121.23.186: icmp_seq=2 ttl=53 time=90.314 ms
64 bytes from 91.121.23.186: icmp_seq=3 ttl=53 time=89.594 ms
64 bytes from 91.121.23.186: icmp_seq=4 ttl=53 time=87.465 ms
64 bytes from 91.121.23.186: icmp_seq=5 ttl=53 time=89.151 ms
64 bytes from 91.121.23.186: icmp_seq=6 ttl=53 time=89.116 ms
64 bytes from 91.121.23.186: icmp_seq=7 ttl=53 time=161.380 ms
64 bytes from 91.121.23.186: icmp_seq=8 ttl=53 time=89.168 ms
64 bytes from 91.121.23.186: icmp_seq=9 ttl=53 time=87.530 ms
64 bytes from 91.121.23.186: icmp_seq=10 ttl=53 time=89.057 ms
64 bytes from 91.121.23.186: icmp_seq=11 ttl=53 time=89.306 ms
64 bytes from 91.121.23.186: icmp_seq=12 ttl=53 time=88.880 ms
64 bytes from 91.121.23.186: icmp_seq=13 ttl=53 time=88.988 ms
64 bytes from 91.121.23.186: icmp_seq=14 ttl=53 time=89.535 ms
64 bytes from 91.121.23.186: icmp_seq=15 ttl=53 time=89.159 ms
64 bytes from 91.121.23.186: icmp_seq=16 ttl=53 time=89.265 ms
64 bytes from 91.121.23.186: icmp_seq=17 ttl=53 time=242.539 ms
64 bytes from 91.121.23.186: icmp_seq=18 ttl=53 time=90.512 ms
64 bytes from 91.121.23.186: icmp_seq=19 ttl=53 time=86.709 ms
64 bytes from 91.121.23.186: icmp_seq=20 ttl=53 time=89.033 ms
64 bytes from 91.121.23.186: icmp_seq=21 ttl=53 time=89.228 ms
64 bytes from 91.121.23.186: icmp_seq=22 ttl=53 time=89.182 ms
64 bytes from 91.121.23.186: icmp_seq=23 ttl=53 time=89.114 ms
64 bytes from 91.121.23.186: icmp_seq=24 ttl=53 time=89.164 ms
64 bytes from 91.121.23.186: icmp_seq=25 ttl=53 time=89.111 ms
64 bytes from 91.121.23.186: icmp_seq=26 ttl=53 time=87.675 ms
64 bytes from 91.121.23.186: icmp_seq=27 ttl=53 time=89.847 ms
64 bytes from 91.121.23.186: icmp_seq=28 ttl=53 time=89.452 ms
64 bytes from 91.121.23.186: icmp_seq=29 ttl=53 time=88.932 ms
"

print_stats(compute_dataset(data))
