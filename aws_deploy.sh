APP_VERSION=`git rev-parse --short HEAD`
APP_NAME="basic-api"

zip -r "${APP_NAME}-${APP_VERSION}.zip" . -x *.git* *.idea*

pip install awscli
S3_BUCKET=`aws s3api list-buckets | grep -Eo 'deployment.*[^"]'`

aws s3 cp ${APP_NAME}-${APP_VERSION}.zip s3://${S3_BUCKET}/${APP_NAME}-${APP_VERSION}.zip