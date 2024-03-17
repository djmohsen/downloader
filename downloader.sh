#!/bin/bash

URL="http://78.110.121.206/files/"
EXTENSIONS='.mp4|.mov|.zip|.rar|.exe|.iso' # limit list
PROXY_FILE="list.txt"
MIN_SPEED=100 # Kbps
MAX_SPEED=1000 # Kbps
NUM_PROXIES=10  # parallel proxies

main() {
    while true; do
        scan_url
        echo "Found files to download: $files"
        proxies=($(shuf "$PROXY_FILE" | head -n $NUM_PROXIES))
        echo "Loaded proxies: ${proxies[*]}"
        for file in $files; do
            for proxy in "${proxies[@]}"; do
                download_file "$proxy" "$file" &
            done
            wait
            echo ""
        done
        sleep 60  # Adjust the sleep duration as needed
    done
}

scan_url() {
    echo "Scanning URL: $URL"
    files=$(curl -s "$URL" | grep -Eo '"[^"]+\.(mp4|mov|zip|rar|exe|iso)"' | sed 's/"//g')
}

download_file() {
    local proxy=$1
    local url=$2
    local speed=$(shuf -i $MIN_SPEED-$MAX_SPEED -n 1)
    echo "Downloading file: $url with proxy: $proxy at speed: $speed KB/s"
    content_length=$(curl -sI "$url" | awk '/Content-Length/ {print $2}' | tr -d '\r')
    curl -s --limit-rate ${speed}K --proxy $proxy "$url" > /dev/null &
    pid=$!
    wait $pid
}

main
