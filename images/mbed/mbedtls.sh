#!/bin/bash
cd "$(dirname "$0")" || exit 1
source ../helper-functions.sh

array=(1.3.10 1.3.11 1.3.12 1.3.13 1.3.14 1.3.15 1.3.16 1.3.17 1.3.18 1.3.19 1.3.20 1.3.21 1.3.22 2.0.0 2.1.0 2.1.1 2.1.2 2.1.3 2.1.4 2.1.5 2.1.6 2.1.7 2.1.8 2.1.9 2.1.10 2.1.11 2.1.12 2.1.13 2.1.14 2.1.15 2.2.0 2.2.1 2.3.0 2.4.0 2.4.2 2.5.1 2.6.0 2.7.0 2.7.1 2.7.3 2.7.4 2.7.5 2.7.6 2.8.0 2.9.0 2.11.0 2.12.0 2.13.0)
typeset -i i=0 max=${#array[*]}
while (( i < max ))
do
	echo "Building: mbed TLS ${array[$i]}"
	_docker build --build-arg VERSION=${array[$i]} -t mbedtls-${array[$i]}-server -f Dockerfile-mbedtls_x --target mbed-server .
	_docker build --build-arg VERSION=${array[$i]} -t mbedtls-${array[$i]}-client -f Dockerfile-mbedtls_x --target mbed-client .
	i=i+1
done

exit "$EXITCODE"
