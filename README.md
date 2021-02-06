# kong

★ Deploy from your laptop:
1. Pull The Repo.
2. open local file.
3. change the image name at docker-compose to match your aws_account-id. 
4. run the deploy.sh to create the task definition and run it. 

★ Build and deploy using circleci config file:
1. Pull The Repo.
2. change the image name at docker-compose to match your aws_account-id. 
2. Add the variables to circleci " prefered to add it as a context "
3. push your changes at the deploy.sh script will push the image to ecr, create the task definition and run it.
