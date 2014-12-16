S3_BUCKET_NAME=`aws s3api list-buckets | grep -Eo 'deployment.*[^"]'`
S3_BUCKET="s3://${S3_BUCKET_NAME}/"
APP_VERSION=`git rev-parse --short HEAD`
APP_NAME="basic-api"

zip -r "${APP_NAME}-${APP_VERSION}.zip" . -x *.git* *.idea*

pip install awscli

aws something