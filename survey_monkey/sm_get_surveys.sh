#!/bin/bash

ACCESSTOKEN=$SM_ACCESS_TOKEN

if [ -z "$ACCESSTOKEN" ]
  then
    echo "Please add a Survey Monkey access token to your environment variables, i.e. export SM_ACCESS_TOKEN=access-token" && exit 1
fi

curl --request GET \
  --url https://api.surveymonkey.com/v3/surveys \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer '$ACCESSTOKEN | jq .