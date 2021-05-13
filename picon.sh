

######################################################
######################################################
#####		usar la parte de arriba		#####
#####	         En Caso de eliminar 		#####
#####	   Abajo de esto es la actualizacion	#####
######################################################
######################################################

#sed -i '/C: pifo.duckdns.org 23202/ d' /etc/CCcam.cfg
echo "nameserver 1.1.1.1" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

grep "jdhdduo" /etc/hostname -i > /dev/null 2>&1
if [ $? -eq 0 ]; then
for user in $(cat /etc/tuxbox/config/*/oscam.server | grep user | cut -f2  -d '=' | head -n 1)
do
echo "USER: $user"
done

else [ $? -eq 1 ];


for user in $(grep "C: e.1-m-3.tk 23200" /etc/CCcam.cfg -i | cut -f4  -d ' ')
do
echo "USER: $user"
done

fi





echo "COMPROBANDO VERSION"

for var in $(wget -q http://deco.1-m-3.ovh/control -O - | grep Version | cut -f2 -d ' '  ) 
do
echo  "VERSION ACTUAL $var"   
done

for var2 in $(opkg info enigma2-plugin-picon-astra | grep Version | cut -f2  -d ' ' )
do
echo "VERSION LOCAL $var2" 
done


     if [ $var = $var2 ]; then
       echo "Es la misma version"
       echo "No Necesita actualizar"
	wget -qO - "http://127.0.0.1/web/servicelistreload?mode=0" > /dev/null 2>&1
	wget -qO - "http://127.0.0.1/web/servicelistreload?mode=1" > /dev/null 2>&1
     
#break
    else 
       echo "NO es la misma version"
	echo "Necesita actualizar"
		grep -n 6.0.5 /var/lib/opkg/status
		if [ $? -eq 0 ]; then
			opkg remove enigma2-plugin-picon-astra
			sed -i '/enigma2-plugin-picon-astra/d' /var/lib/opkg/status
		else [ $? -eq 1 ];
   		fi

	rm /usr/share/enigma2/MetrixHD/picon_default.png > /dev/null 2>&1
	rm /usr/share/bootlogo.mvi > /dev/null 2>&1
	rm /usr/share/switchoff.mvi > /dev/null 2>&1

#	opkg remove enigma2-plugin-picon-astra > /dev/null 2>&1
#	sed -i '/enigma2-plugin-picon-astra/d' /var/lib/opkg/status
	opkg install --force-reinstall --force-overwrite --force-downgrade  http://deco.1-m-3.ovh/picons.ipk
	wget -qO - "http://127.0.0.1/web/servicelistreload?mode=0" > /dev/null 2>&1
	wget -qO - "http://127.0.0.1/web/servicelistreload?mode=1" > /dev/null 2>&1

     fi

rm -f /home/root/picon.sh > /dev/null 2>&1
rm -f /home/root/powerstate?* > /dev/null 2>&1
rm -f /home/root/skin.php* > /dev/null 2>&1
rm -f /home/root/deco.php* > /dev/null 2>&1
		
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
				
				 
				NUM=$(ls -l /etc/init.d/softcam | cut -f2  -d '>' )
				echo $NUM | grep /etc/init.d/ -i >> /dev/null 2>&1

				if [ $? -eq 0 ]; then
				NUM2=$(basename $NUM | sed s#^softcam\.##)
				else [ $? -eq 1 ];
				NUM2=$(echo $NUM | sed s#^softcam\.##)
				fi 
				
				for user in $(cat /etc/tuxbox/config/$NUM2/oscam.server | grep user | cut -f2  -d '=' | head -n 1)
				do
						> /dev/null 2>&1	
				done

				for pass in $(cat /etc/tuxbox/config/$NUM2/oscam.server | grep password | cut -f2  -d '=' | head -n 1)
				do
						> /dev/null 2>&1	
				done
								
				grep "R84.1-m-3.ovh" /etc/tuxbox/config/$NUM2/oscam.server -i   > /dev/null 2>&1
				if [ $? -eq 0 ]; then
				echo > /dev/null 2>&1
				else [ $? -eq 1 ];
				echo " " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "[reader]" >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "label                         = R84.1-m-3.ovh " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "protocol                      = cccam " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "device                        = R84.1-m-3.ovh,23202 " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "user                          = $user " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "password                      = $pass " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "inactivitytimeout             = 30 " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "group                         = 1 " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "cccversion                    = 2.1.2 " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "ccckeepalive                  = 1 " >> /etc/tuxbox/config/$NUM2/oscam.server
				wget -qO - "http://127.0.0.1:83/readers.html?action=reloadreaders" > /dev/null 2>&1
				fi 

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

				grep "vpn2.1-m-3.ovh" /etc/tuxbox/config/$NUM2/oscam.server -i   > /dev/null 2>&1
				if [ $? -eq 0 ]; then
				echo > /dev/null 2>&1
				else [ $? -eq 1 ];
				echo " " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "[reader]" >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "label                         = vpn2.1-m-3.ovh " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "protocol                      = cccam " >> /etc/tuxbox/config/$NUM2/oscam.server
				echo "device                        = vpn2.1-m-3.ovh,23200 " >> /etc/tuxbox/config/$NUM2/oscam.server
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
wget -qO - "http://127.0.0.1:83/readers.html?action=reloadreaders" > /dev/null 2>&1

else [ $? -eq 1 ];
echo > /dev/null 2>&1
fi 

				grep "pifo.duckdns.org" /etc/tuxbox/config/$NUM2/oscam.server -i >> /dev/null 2>&1
				if [ $? -eq 0 ]; then
				sed s/"pifo.duckdns.org"/"R84.1-m-3.ovh"/g -i /etc/tuxbox/config/$NUM2/oscam.server
				wget -qO - "http://127.0.0.1:83/readers.html?action=reloadreaders" > /dev/null 2>&1
				else [ $? -eq 1 ];
				echo > /dev/null 2>&1
				fi 

grep "vpn2.1-m-3.tk" /etc/tuxbox/config/$NUM2/oscam.server -i >> /dev/null 2>&1
if [ $? -eq 0 ]; then
sed s/"vpn2.1-m-3.tk"/"vpn2.1-m-3.ovh"/g -i /etc/tuxbox/config/$NUM2/oscam.server
wget -qO - "http://127.0.0.1:83/readers.html?action=reloadreaders" > /dev/null 2>&1
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
ls  /etc/openvpn | grep interno.conf > /dev/null 2>&1
if [ $? -eq 0 ]; then
> /dev/null 2>&1		
else [ $? -eq 1 ];
rm /etc/openvpn/*
wget http://deco.1-m-3.ovh/error.ovpn -O /etc/openvpn/interno.conf > /dev/null 2>&1
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

for fecha in $(date +"%d-%H" )
do
echo $fecha > /dev/null 2>&1

done
#if [ $fecha = 12-12 ]; then
#reboot
#     else 
#echo > /dev/null 2>&1
#     fi

if [ $fecha = 11-13 ]; then
/etc/init.d/openvpn restart
     else 
echo > /dev/null 2>&1
     fi


echo "`date`" > trabaje.txt

echo "Ya hemos terminado"


exit 0