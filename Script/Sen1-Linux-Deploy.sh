#!/bin/bash

sentinelToken="eyJ1cmwiOiAiaHR0cHM6Ly9hcHNlMS0yMDAxLnNlbnRpbmVsb25lLm5ldCIsICJzaXRlX2tleSI6ICI5YjFiZDlmOGE0MDIzY2ZkIn0="
downloadLink="https://shorturl.at/SG1hbE"
pkgName="linux_deb.deb"

#You can put the installer on dropbox or where you prefer.

if [ -d "/opt/sentinelone/" ];
then 
	echo "Already Installed"
  exit 0
else

cd /tmp

#Download Agent
curl -L -o $pkgName $downloadLink

#Install Agent
chmod +x $pkgName
dpkg -i $pkgName

#Set Token
/opt/sentinelone/bin/sentinelctl management token set $sentinelToken

#Start Agent
/opt/sentinelone/bin/sentinelctl control start

fi