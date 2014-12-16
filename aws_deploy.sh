export S3_BUCKET_NAME = `aws s3api list-buckets | grep -Eo 'deployment.*[^"]'`
export S3_BUCKET = "s3://${S3_BUCKET_NAME}/"
export APP_VERSION=`git rev-parse --short HEAD`

zip -x *.git* -r "${APP_NAME}-${APP_VERSION}.zip" .
pip install awscli