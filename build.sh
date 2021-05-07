#!/bin/bash 
PATH_PROJECT=$(pwd)
APP_NAME=${PWD##*/}

# build apk
flutter clean
flutter pub get
flutter build apk

# move file app-release.aab to folder certs
cp "$PATH_PROJECT/build/app/outputs/apk/app-release.apk" "$PATH_PROJECT/$APP_NAME.apk"