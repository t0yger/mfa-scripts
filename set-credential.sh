unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN
MFA_DEVICE_ARN=`aws iam list-mfa-devices | jq -r '.MFADevices[0].SerialNumber'`
CREDENTIAL=`aws sts get-session-token --serial-number $MFA_DEVICE_ARN --token-code $1`
export AWS_ACCESS_KEY_ID=`echo $CREDENTIAL | jq -r '.Credentials.AccessKeyId'`
export AWS_SECRET_ACCESS_KEY=`echo $CREDENTIAL | jq -r '.Credentials.SecretAccessKey'`
export AWS_SESSION_TOKEN=`echo $CREDENTIAL | jq -r '.Credentials.SessionToken'`