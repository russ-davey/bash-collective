#!/bin/bash

SURVEY_ID=$1
PAGE_ID=$2
ACCESSTOKEN=$SM_ACCESS_TOKEN

if [ -z "$ACCESSTOKEN" ]
  then
    echo "Please add a Survey Monkey access token to your environment variables, i.e. export SM_ACCESS_TOKEN=access-token" && exit 1
fi

if [ -z "$1" ]
  then
    echo "Survey ID required" && exit 1
fi

if [ -z "$2" ]
  then
    echo "Page ID required" && exit 1
fi

curl --request GET \
  --url https://api.surveymonkey.com/v3/surveys/$SURVEY_ID/pages/$PAGE_ID/questions \
  --header 'Accept: application/json' \
  --header 'Authorization: Bearer '$ACCESSTOKEN | jq .