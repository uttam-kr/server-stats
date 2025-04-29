#!/bin/bash
#function to display cpu usage
cpu_usage() {
	 echo "1. Total CPU Usage:"
	 cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
	 echo "CPU Usage: $cpu_usage%"
}

memory_usage() {
	echo "2. Total Memory Usage:"
	total_mem=$(free -m | awk '/^Mem:/{print $2}')
	used_mem=$(free -m | awk '/^Mem:/{print $3}')
	free_mem=$(free -m | awk '/^Mem:/{print $4}')
	mem_percentage=$(awk "BEGIN {printf \"%.2f\", ($used_mem/$total_mem)*100}")
	echo "Total Memory: $total_mem MB"
	echo "Used Memory: $used_mem MB ($mem_percentage%)"
	echo "Free Memory: $free_mem MB"
}

disk_usage() {
	echo "3. Total Disk Usage:"
	disk_usage=$(df -h --total | grep 'total' | awk '{print $3}')
	disk_free=$(df -h --total | grep 'total' | awk '{print $4}')
	disk_percentage=$(df -h --total | grep 'total' | awk '{print $5}')
	echo "Disk Used: $disk_usage"
	echo "Disk Free: $disk_free"
	echo "Disk Usage Percentage: $disk_percentage"
}

top_processes_cpu() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo ""
}

# Function to display top 5 processes by memory usage
top_processes_memory() {
    echo "Top 5 Processes by Memory Usage:"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    echo ""
}

# Optional stretch goals:
os_info() {
    echo "OS Version:"
    lsb_release -a
    echo ""
}

uptime_info() {
    echo "Uptime:"
    uptime
    echo ""
}

load_average() {
    echo "Load Average:"
    uptime | awk '{print "  Load average: " $9}'
    echo ""
}

logged_in_users() {
    echo "Logged-in Users:"
    who
    echo ""
}

failed_logins() {
    echo "Failed Login Attempts:"
    lastb | head
    echo ""
}
cpu_usage
memory_usage
disk_usage
top_processes_cpu
top_processes_memory
os_info
uptime_info
load_average
logged_in_users
failed_logins




