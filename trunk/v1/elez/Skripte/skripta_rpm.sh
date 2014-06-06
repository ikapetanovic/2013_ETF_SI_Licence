#/bin/bash
#required cronie mysql-client 
LICSRV=10.20.0.73
IP=`ifconfig |grep inet|grep -v inet6|cut -d ":" -f2|cut -d " " -f1|grep -v 127.0.0.1`
OS="`head -1 /etc/issue.net`"
DBUSER=root
DBPASS=root
mysql -u $DBUSER -p$DBPASS -h $LICSRV elez -e "DELETE FROM software WHERE machinename='$HOSTNAME'"
mysql -u $DBUSER -p$DBPASS -h $LICSRV elez -e "DELETE FROM machines WHERE machinename='$HOSTNAME'"

#UPIS INFORMACIJA O MASINI
mysql -u $DBUSER -p$DBPASS -h $LICSRV elez -e "INSERT INTO machines (machinename, machineos, machineip) VALUES ('$HOSTNAME', '$OS','$IP')"

#UPIS SPISKA INSTALIRANOG SOFTWARE-a
for i in $(rpm -qa --queryformat '%{NAME}\n' | sort | uniq); do mysql -u $DBUSER -p$DBPASS -h $LICSRV elez -e "INSERT INTO software (softwarename, machinename) VALUES ('$i', '$HOSTNAME')";done
