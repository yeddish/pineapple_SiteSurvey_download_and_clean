echo Please enter Pineapple password to copy captures.
scp root@172.16.42.1:/pineapple/modules/SiteSurvey/capture/* ~/wcaps/
cd ~/wcaps

echo -n
echo Extracting 4-way handshakes...
for i in capture*.cap ; do tshark -r "$i" -Y "eapol || wlan.fc.type_subtype == 0x08" -w "`basename "$i" .cap`.4WHS.cap" 2>/dev/null ; done

echo -n
echo Generating rename script
grep PSK capture*.csv | cut -d ',' - -f 1,14 | sed 's/:.*,//g'| sed 's/csv /cap \"/' | sed 's/^/mv /' | sed 's/$/\.cap\"/' > ./temp_script.sh

grep PSK capture*.csv | cut -d ',' - -f 1,14 | sed 's/:.*,//g'| sed 's/csv /4WHS.cap \"/' | sed 's/^/mv /' | sed 's/$/\.4WHS.cap\"/' >> ./temp_script.sh

grep PSK capture*.csv | cut -d ',' - -f 1,14 | sed 's/:.*,//g'| sed 's/csv /kismet\.csv \"/' | sed 's/^/mv /' | sed 's/$/\.kismet\.csv\"/' >> ./temp_script.sh

grep PSK capture*.csv | cut -d ',' - -f 1,14 | sed 's/:.*,//g'| sed 's/csv /kismet\.netxml \"/' | sed 's/^/mv /' | sed 's/$/\.kismet\.netxml\"/' >> ./temp_script.sh

grep PSK capture*.csv | cut -d ',' - -f 1,14 | sed 's/:.*,//g'| sed 's/csv /csv \"/' | sed 's/^/mv /' | sed 's/$/\.csv\"/' >> ./temp_script.sh

chmod a+x temp_script.sh
#cat ./temp_script.sh

echo -n
echo Renaming files to the SSID...
./temp_script.sh
rm -f temp_script.sh

echo -n
echo Done.
