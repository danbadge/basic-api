APP_VERSION=`git rev-parse --short HEAD`
APP_NAME="basic-api-${APP_VERSION}"

zip -r "${APP_NAME}.zip" . -x *.git* *.idea*

pip install awscli
S3_BUCKET=`aws s3api list-buckets | grep -Eo 'deployment.*[^"]'`

aws s3 cp ${APP_NAME}.zip s3://${S3_BUCKET}/${APP_NAME}.zip

aws cloudformation create-stack --stack-name ${APP_NAME} --template-body "file://./instances.json"