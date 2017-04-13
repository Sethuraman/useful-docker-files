#!/bin/sh

exitWithMessage() {
  echo "$1"
  exit 1
}

validateEnvironmentVariables() {
  if [ -z $AWS_ACCESS_KEY_ID ]; then
    exitWithMessage "AWS_ACCESS_KEY_ID missing"
  fi
  if [ -z $AWS_SECRET_ACCESS_KEY ]; then
    exitWithMessage "AWS_SECRET_ACCESS_KEY missing"
  fi
  if [ -z $AWS_DEFAULT_REGION ]; then
    exitWithMessage "AWS_DEFAULT_REGION missing"
  fi
  if [ -z $BUCKET_NAME ]; then
    exitWithMessage "BUCKET_NAME missing"
  fi
  if [ -z $CONCOURSE_DOWNLOAD_URL ]; then
    exitWithMessage "CONCOURSE_DOWNLOAD_URL missing"
  fi

}

mkdir keys
ssh-keygen -t rsa -f keys/tsa_host_key -N ''
ssh-keygen -t rsa -f keys/worker_key -N ''
ssh-keygen -t rsa -f keys/session_signing_key -N ''

aws s3 sync keys s3://$BUCKET_NAME/keys

wget -O concourse $CONCOURSE_DOWNLOAD_URL

aws s3 cp concourse s3://$BUCKET_NAME/binaries/concourse
