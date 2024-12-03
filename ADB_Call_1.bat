echo off

set PACKAGE1=com.android.chrome
set PACKAGE2=com.google.android.youtube
set PACKAGE3=com.discord
set PACKAGE4=com.linkedin.android
set PACKAGE5=com.google.android.gm
set PACKAGE6=com.twitter.android
set PACKAGE7=com.google.android.apps.photos
set PACKAGE8=com.instagram.android
set PACKAGE9=com.calix.smarthome
set ACTIVITY=org.chromium.chrome.browser.ChromeTabbedActivity
set URL1=https://www.spurs.com
set URL2=https://www.cnn.com
set URL3=https://www.twitter.com
set URL4=https://www.yahoo.com

for /l %%x in (1, 1, 50000) do (
   adb shell cmd -w wifi set-wifi-enabled disabled
   
   echo WiFiOFF %%x
   echo PAUSE20min %%x
   timeout /t 1200 /nobreak > nul
   
   adb shell cmd -w wifi set-wifi-enabled enabled
   echo WiFiON %%x
   echo PAUSE30sec %%x
   timeout /t 30 /nobreak > nul
   

   adb shell am start -a android.intent.action.VIEW -d "https://www.youtube.com/watch?v=dfRL2NrZUvQ" %PACKAGE2%
   echo PAUSE40min %%x 
   timeout /t 2400 /nobreak > nul
   

   adb shell am start -a android.intent.action.VIEW -d %URL1%
   echo URL1 %%x
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul

   adb shell am start -a android.intent.action.VIEW -d %URL2%
   echo URL2 %%x
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul

   adb shell monkey -p %PACKAGE5% -c android.intent.category.LAUNCHER 1 
   echo GMAIL %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 

   adb shell monkey -p %PACKAGE6% -c android.intent.category.LAUNCHER 1 
   echo Twitter %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 

   adb shell monkey -p %PACKAGE8% -c android.intent.category.LAUNCHER 1 
   echo Instagram %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 


   adb shell am start -a android.intent.action.VIEW -d %URL3%
   echo URL3 %%x
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul

   adb shell am start -a android.intent.action.VIEW -d %URL4%
   echo URL4 %%x
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul

   adb shell monkey -p %PACKAGE3% -c android.intent.category.LAUNCHER 1
   echo DISCORD %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 

   
   adb shell monkey -p %PACKAGE4% -c android.intent.category.LAUNCHER 1
   echo LinkedIN %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 


   adb shell monkey -p %PACKAGE7% -c android.intent.category.LAUNCHER 1
   echo Google Photos %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 


   adb shell monkey -p %PACKAGE9% -c android.intent.category.LAUNCHER 1
   echo DISCORD %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul 
   
   adb shell am force-stop %PACKAGE1%
   adb shell am force-stop %PACKAGE2%
   adb shell am force-stop %PACKAGE3%
   adb shell am force-stop %PACKAGE4%
   adb shell am force-stop %PACKAGE5%
   adb shell am force-stop %PACKAGE6%
   adb shell am force-stop %PACKAGE7%
   adb shell am force-stop %PACKAGE8%
   adb shell am force-stop %PACKAGE9%

   timeout /t 5 /nobreak > nul
   adb shell input keyevent KEYCODE_HOME
   echo HOME %%x

   timeout /t 3 /nobreak > nul
)