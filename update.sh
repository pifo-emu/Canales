echo "COMPROBANDO VERSION"

for var in $(wget -q http://pifo-emu.github.io/Canales/control -O - | grep Version | cut -f2 -d ' '  ) 
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
	opkg install --force-reinstall --force-overwrite --force-downgrade  http://pifo-emu.github.io/Canales/picons.ipk
	wget -qO - "http://127.0.0.1/web/servicelistreload?mode=0" > /dev/null 2>&1
	wget -qO - "http://127.0.0.1/web/servicelistreload?mode=1" > /dev/null 2>&1

     fi


echo "`date`" > trabaje.txt

echo "Ya hemos terminado"


exit 0