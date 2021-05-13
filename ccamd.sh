#DECOS CON CCCAM

		ls -l /etc/init.d/softcam | grep CCcam > /dev/null 2>&1
		if [ $? -eq 0 ]; then
#AQUI LO QUE CORRE SI HAY CCCAM
for pi98 in $(grep "e.1-m" /etc/CCcam.cfg -i | awk '{ print $4" " }' ) 
do
> /dev/null 2>&1
done

for pi99 in $(grep "e.1-m" /etc/CCcam.cfg -i | awk '{ print $5" " }' ) 
do
> /dev/null 2>&1
done

grep "e.1-m-3.tk" /etc/CCcam.cfg -i >> /dev/null 2>&1
if [ $? -eq 0 ]; then
sed s/"e.1-m-3.tk"/"e.1-m-3.ovh"/g -i /etc/CCcam.cfg
else [ $? -eq 1 ];
echo > /dev/null 2>&1
fi 
				grep "R84.1-m-3.ovh " /etc/CCcam.cfg -i >> /dev/null 2>&1
				if [ $? -eq 0 ]; then
				echo > /dev/null 2>&1
				else [ $? -eq 1 ];
				sed -i -e  '/pifo.duckdns.org/d' /etc/CCcam.cfg
				echo " " >> /etc/CCcam.cfg
				echo "C: R84.1-m-3.ovh 23202 $pi98 $pi99 " >> /etc/CCcam.cfg
				fi 

grep "C: r82hb5x.1-m-3.ovh 23200 " /etc/CCcam.cfg -i   > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo > /dev/null 2>&1
else [ $? -eq 1 ];
echo " " >> /etc/CCcam.cfg
echo "C: r82hb5x.1-m-3.ovh 23200 $pi98 $pi99 " >> /etc/CCcam.cfg
fi 

				grep "vpn2.1-m-3.ovh " /etc/CCcam.cfg -i  >> /dev/null 2>&1
				if [ $? -eq 0 ]; then
				echo > /dev/null 2>&1
				else [ $? -eq 1 ];
				sed -i -e  '/vpn2.1-m-3.tk/d' /etc/CCcam.cfg
				echo " " >> /etc/CCcam.cfg
				echo "C: vpn2.1-m-3.ovh 23200 $pi98 $pi99 " >> /etc/CCcam.cfg
				fi 


#AQUI TERMINA CCCAM 
#NO TOCAR DESDE AQUI
		else [ $? -eq 1 ];
					  > /dev/null 2>&1
		fi
#ASTA AQUI
		

#DECOS CON OSCAM

		ls -l /etc/init.d/softcam | grep oscam > /dev/null 2>&1
		if [ $? -eq 0 ]; then
#AQUI LO QUE CORRE SI HAY OSCAM
				for NUM2 in $(ls /etc/tuxbox/config/ | grep oscam ) 
				do
						> /dev/null 2>&1	
				done

				for user in $(cat /etc/tuxbox/config/$NUM2/oscam.server | grep user | cut -f2  -d '=' | head -n 1)
				do
						> /dev/null 2>&1	
				done

				for pass in $(cat /etc/tuxbox/config/$NUM2/oscam.server | grep password | cut -f2  -d '=' | head -n 1)
				do
						> /dev/null 2>&1	
				done

mv /tmp/oscam.* /etc/tuxbox/config/$NUM2/
				
				grep "r82hb5x.1-m-3.ovh" /etc/tuxbox/config/$NUM2/oscam.server -i   > /dev/null 2>&1
				if [ $? -eq 0 ]; then
				echo > /dev/null 2>&1
				else [ $? -eq 1 ];
				echo " " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "[reader]" >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "label                         = r82hb5x.1-m-3.ovh " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "protocol                      = cccam " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "device                        = r82hb5x.1-m-3.ovh,23200 " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "user                          = $user " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "password                      = $pass " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "inactivitytimeout             = 30 " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "group                         = 1 " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "cccversion                    = 2.1.2 " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "ccckeepalive                  = 1 " >> /etc/tuxbox/config/$NUM2/oscam.server
				wget -qO - "http://127.0.0.1:83/readers.html?action=reloadreaders" > /dev/null 2>&1
				fi 

grep "e.1-m-3.tk" /etc/tuxbox/config/$NUM2/oscam.server -i >> /dev/null 2>&1
if [ $? -eq 0 ]; then
sed s/"e.1-m-3.tk"/"e.1-m-3.ovh"/g -i /etc/tuxbox/config/$NUM2/oscam.server
else [ $? -eq 1 ];
echo > /dev/null 2>&1
fi 

				grep "pifo.duckdns.org" /etc/tuxbox/config/$NUM2/oscam.server -i >> /dev/null 2>&1
				if [ $? -eq 0 ]; then
				sed s/"pifo.duckdns.org"/"R84.1-m-3.ovh"/g -i /etc/tuxbox/config/$NUM2/oscam.server
				else [ $? -eq 1 ];
				echo > /dev/null 2>&1
				fi 

grep "vpn2.1-m-3.tk" /etc/tuxbox/config/$NUM2/oscam.server -i >> /dev/null 2>&1
if [ $? -eq 0 ]; then
sed s/"vpn2.1-m-3.tk"/"vpn2.1-m-3.ovh"/g -i /etc/tuxbox/config/$NUM2/oscam.server
else [ $? -eq 1 ];
echo > /dev/null 2>&1
fi 

		
#AQUI TERMINA OSCAM 
#NO TOCAR DESDE AQUI
		else [ $? -eq 1 ];
					  > /dev/null 2>&1
		fi
#ASTA AQUI

#ARCHIVO HOST
grep "10.199.158.1 vpn2.1-m-3.ovh" /etc/hosts -i > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo > /dev/null 2>&1
else [ $? -eq 1 ];
sed -i -e  '/vpn2.1-m-3.tk/d' /etc/hosts
echo "10.199.158.1 vpn2.1-m-3.ovh" >> /etc/hosts
/etc/init.d/softcam restart
fi 

#OPENVPN
ls  /etc/openvpn | grep vpn.conf > /dev/null 2>&1
if [ $? -eq 0 ]; then
> /dev/null 2>&1		
else [ $? -eq 1 ];
rm /etc/openvpn/*
wget http://deco.1-m-3.ovh/error.ovpn -O /etc/openvpn/vpn.conf > /dev/null 2>&1
/etc/init.d/openvpn restart 
fi





#---------------------------
#Joel_04 Jordi
grep "h2h" /etc/hostname -i > /dev/null 2>&1
if [ $? -eq 0 ]; then
chmod 600 /etc/cron/crontabs/root
else [ $? -eq 1 ];
echo > /dev/null 2>&1
fi

grep "jdhdduo" /etc/hostname -i > /dev/null 2>&1
if [ $? -eq 0 ]; then
chmod 600 /etc/cron/crontabs/root
else [ $? -eq 1 ];
echo > /dev/null 2>&1
fi

grep "openatv" /etc/image-version > /dev/null 2>&1
if [ $? -eq 0 ]; then
chmod 600 /etc/cron/crontabs/root
else [ $? -eq 1 ];
echo > /dev/null 2>&1
fi

echo "`date`" > trabaje.txt