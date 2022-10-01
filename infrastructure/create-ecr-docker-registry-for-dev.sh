PATH="$PATH:/usr/local/bin"
APP_REPO_NAME="clarusway-repo/petclinic-app-dev"
AWS_REGION="us-east-1"
aws ecr describe-repositories --region ${AWS_REGION} --repository-name ${APP_REPO_NAME} || \
if [ $(echo $?) -eq 0 ]
   then
	echo "ecr repo already created"
	
   else
     aws ecr create-repository \
     --repository-name ${APP_REPO_NAME} \
     --image-scanning-configuration scanOnPush=false \
     --image-tag-mutability MUTABLE \
     --region us-east-1
fi