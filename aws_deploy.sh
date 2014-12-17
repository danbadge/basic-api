APP_VERSION=`git rev-parse --short HEAD`
APP_NAME="basic-api-${APP_VERSION}"

zip -r "${APP_NAME}.zip" . -x *.git* *.idea*

pip install awscli
pip install jq

RUNNING_INSTANCE_IDS=`aws ec2 describe-instances --filters Name=instance-state-name,Values=running | jq --raw-output .Reservations[]?.Instances[]?.InstanceId`
IDLE_INSTANCE_IDS=`aws ec2 describe-instances --filters Name=instance-state-name,Values=stopped | jq --raw-output .Reservations[]?.Instances[]?.InstanceId`

aws ec2 start-instances --instance-ids ${IDLE_INSTANCE_IDS}

aws ec2 stop-instances --instance-ids ${RUNNING_INSTANCE_IDS}

#S3_BUCKET=`aws s3api list-buckets | grep -Eo 'deployment.*[^"]'`

#aws s3 cp ${APP_NAME}.zip s3://${S3_BUCKET}/${APP_NAME}.zip 