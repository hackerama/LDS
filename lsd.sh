#/bin/bash
# Coded by Carlos Neri 
# LAN Discovery Script

gateway=$(route |grep default|cut -d " " -f 10 |sed 's/..$//')

echo -e "\n\033[1;32mStarting active hosts discovery...\033[0m\n"

for host in {1..254};do
    A=`ping -W1 -c1 $gateway.$host |grep "ttl" |cut -d " " -f 4|cut -d ":" -f 1`

if [ -z "$A" ];then
echo -e "\033[1;31mHost \033[1;35m $gateway.$host \033[1;31m seems to be dead \033[0m" 
else
echo -e "\033[45;1;37m  Active host found : $gateway.$host  \033[0m "
fi 
done

