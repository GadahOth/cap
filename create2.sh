aws cloudformation create-stack \
--capabilities CAPABILITY_IAM \
--stack-name $1 \
--template-body file://$2 \
--region=us-west-2