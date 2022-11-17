#/usr/bin/fish
set hostip $(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
set wslip $(hostname -I | awk '{print $1}')
set port 7890
set PROXY_HTTP "http://$hostip:$port"

function set_proxy
    set -gx http_proxy "$PROXY_HTTP"
    set -gx HTTP_PROXY "$PROXY_HTTP"

    set -gx https_proxy "$PROXY_HTTP"
    set -gx HTTPS_proxy "$PROXY_HTTP"
end

function unset_proxy
    set -u http_proxy
    set -u HTTP_PROXY
    set -u https_proxy
    set -u HTTPS_PROXY
end

function test_setting
    echo "Host ip:" $hostip
    echo "WSL ip:" $wslip
    echo "Current proxy:" $https_proxy
end

if test "$argv" = "set" 
    set_proxy
    echo $http_proxy
else if test "$argv" = "unset" 
    unset_proxy
else if test "$argv" = "test" 
    test_setting
else
    echo "Unsupported arguments."
end
