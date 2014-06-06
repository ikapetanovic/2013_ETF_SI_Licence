#/bin/bash
#required mysql-client members sudo
LICSRV=10.20.0.73
DBNAME=elez
DBUSER=root
DBPASS=root
IP=`ifconfig |grep inet|grep -v inet6|cut -d ":" -f2|cut -d " " -f1|grep -v 127.0.0.1`
OS="`head -1 /etc/issue.net`"

#priprema
mysql -u $DBUSER -p$DBPASS -h $LICSRV $DBNAME -e "DELETE FROM software WHERE machinename='$HOSTNAME'"
mysql -u $DBUSER -p$DBPASS -h $LICSRV $DBNAME -e "DELETE FROM machines WHERE machinename='$HOSTNAME'"

#UPIS INFORMACIJA O MASINI
mysql -u $DBUSER -p$DBPASS -h $LICSRV $DBNAME -e "INSERT INTO machines (machinename, machineos,machineip) VALUES ('$HOSTNAME', '$OS','$IP')"

#UPIS SPISKA INSTALIRANOG SOFTWARE-a
for i in $(dpkg --get-selections|awk '{print $1}'); do mysql -u $DBUSER -p$DBPASS -h $LICSRV $DBNAME -e "INSERT INTO software (softwarename, machinename) VALUES ('$i', '$HOSTNAME')";done

