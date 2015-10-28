#!/bin/bash

declare -a targets

targets=(
)

while true; do
  for i in ${targets[@]}; do
    echo "Target environment: ${i}"

    echo "Fetching username/password combinations"
    END_POINT_URL=`grep END_POINT_URL PreferenceConstants.e2emasterc`
    BASE_URL=`echo ${URL/public final static String END_POINT_URL = \"/} | sed 's/\/";//g'`
    mkdir -p app/src/androidTest/assets
    curl --silent ${BASE_URL}/rest/json/user/all > app/src/androidTest/assets/users.json

    cp PreferenceConstants.${i} app/src/main/java/com/appdynamics/pmdemoapps/android/ECommerceAndroid/misc/PreferenceConstants.java 
    ./WakeUpAndRun.sh
  done
done
