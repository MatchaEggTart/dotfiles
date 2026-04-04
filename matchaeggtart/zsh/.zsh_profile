function proxy_on() {
    export http_proxy="socks5://127.0.0.1:1080"
    export https_proxy=$http_proxy
    echo -e "\nPROXY is ON\n"
}

function proxy_off(){
    unset http_proxy https_proxy
    echo -e "\nPROXY is OFF\n"
}

function proxy_status() {
    echo 
    if [ -z ${https_proxy} ]; then
	echo -e "PROXY is OFF\n"
    else
	echo -e "PROXY is ON\n"
    fi
}

function proxy_test() {
    curl -I http://www.google.com
}
