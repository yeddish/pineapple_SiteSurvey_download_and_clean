# pineapple_SiteSurvey_download_and_clean
This script downloads the capture files from a Wifi Pineapple running the Site Survey module via SCP.
Once the download finishes, it extracts the 4-way handshakes from the .cap files and stores them in .4WHS.cap.
Then, it parses the .csv file to extract the SSID and renames each of the captures according to their SSIDs for easy identification.
Captures are NOT removed from the Wifi Pineapple!

Note that paths are hardcoded and can be adjusted.
By default, it stores the captures in ~/wcaps.
