#!/bin/sh
echo "Install metasploit framework"
echo "Do you have metasploit? (yes/no)"
echo "[1] yes"
echo "[2] no"
echo -n "you enter: "
read choice
case $choice in
	1)
	  echo "Installing...."
	  break
	  ;;
	2)
	  echo "you don't need install metasploit"
	  echo "please run sjxrat.sh"
	  break
	  exit
	  ;;
	*)
	  echo "Plese run and enter again !!!"
	  break
	  exit
	  ;;

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall
echo "Install successfully !!!"
echo "Please enter 'y' or 'yes' to creat database"
echo "After creat database , please close terminal"
msfconsole

