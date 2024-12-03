#!/bin/zsh

PACKAGE1="com.android.chrome"
PACKAGE2="com.google.android.youtube"
PACKAGE3="com.linkedin.android"
PACKAGE4="com.google.android.apps.photos"
PACKAGE5="com.twittter.android"
PACKAGE6="com.discord"
ACTIVITY="org.chromium.chrome.browser.ChromeTabbedActivity"

URL1="https://www.spurs.com"
URL2="https://www.cnn.com"
URL3="https://google.com/finance"
URL4="https://www.facebook.com"

iterations=500
#setlocal enabledelayedexpansion

for x in {1..$iterations}
do
   adb shell cmd -w wifi set-wifi-enabled disabled
   
   echo WiFiOFF "$x"
   echo PAUSE5min $x
   sleep 300
   
   adb shell cmd -w wifi set-wifi-enabled enabled
   echo WiFiON $x
   echo PAUSE30sec $x
   sleep 30
   
   adb shell am start -a android.intent.action.VIEW -d "https://www.youtube.com/watch?v=dfRL2NrZUvQ" $PACKAGE2
   echo PAUSE20min $x
   sleep 1200
   

   adb shell am start -a android.intent.action.VIEW -d $URL1
   echo URL1 $x
   sleep 60
   

   adb shell am start -a android.intent.action.VIEW -d $URL2
   echo URL2 $x
   sleep 60
   
   adb shell monkey -p %PACKAGE3% -c android.intent.category.LAUNCHER 1
   echo LinkedIN %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   
   adb shell monkey -p %PACKAGE4% -c android.intent.category.LAUNCHER 1
   echo Photos %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul

   adb shell am start -a android.intent.action.VIEW -d $URL3
   echo URL3 $x
   sleep 60
   

   adb shell am start -a android.intent.action.VIEW -d $URL4
   echo URL4 $x
   sleep 60
   
   adb shell monkey -p %PACKAGE5% -c android.intent.category.LAUNCHER 1
   echo Twitter %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   
   adb shell monkey -p %PACKAGE6% -c android.intent.category.LAUNCHER 1
   echo Discord %%x
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   adb shell input swipe 500 1500 500 100 1000
   timeout /t 30 /nobreak > nul
   
   adb shell am force-stop $PACKAGE1
   adb shell am force-stop $PACKAGE2
   adb shell am force-stop $PACKAGE3
   adb shell am force-stop $PACKAGE4
   adb shell am force-stop $PACKAGE5
   adb shell am force-stop $PACKAGE6
   sleep 5
   adb shell input keyevent KEYCODE_HOME
   echo HOME "$x"

   sleep 5
done
