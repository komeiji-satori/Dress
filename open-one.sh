pwd
while true; do start $(find . -name "*.jpg" | shuf -n 1) && sleep 4; done