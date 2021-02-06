#!/bin/bash

echo -e  "Deploy To ECS\n...........................\n"
read -t 20 -p 'Do you have ECS config Profile (yes/no) ' answer
if [ $answer == no ]
then 
clear
echo -e "Fill the upcoming params to setup your ECS Config profile:\n"
read -t 20 -p 'Profile: ' profile
read -t 20 -sp 'AccessKey: ' accesskey
echo""
read -t 20 -sp 'SecretKey: ' secretkey
ecs-cli configure profile --profile-name $profile --access-key $accesskey --secret-key $secretkey
clear
echo -e  "Fill the upcoming params to setup your ECS Cluster:\n"
read -t 20 -p 'Cluster_Name: ' cluster_name
read -t 20 -p 'Launch_Type (EC2,fargate): ' launch_type
read -t 20 -p 'Region: ' region 
read -t 20 -p 'Config_Name: ' config_name
ecs-cli configure --cluster $cluster_name --default-launch-type $launch_type --region $region --config-name $config_name
echo -e "Create Task and Run it\n"
ecs-cli compose up  --cluster-config $config_name --ecs-profile $profile
else
clear
echo -e  "Fill the upcoming params to setup your ECS Cluster:\n"
read -t 20 -p 'Cluster_Name: ' cluster_name
read -t 20 -p 'Launch_Type (EC2,fargate): ' launch_type
read -t 20 -p 'Region: ' region 
read -t 20 -p 'Config_Name: ' config_name
read -t 20 -p 'Profile: ' profile
ecs-cli configure --cluster $cluster_name --default-launch-type $launch_type --region $region --config-name $config_name
echo -e "Create Task and Run it\n"
ecs-cli compose up  --cluster-config $config_name --ecs-profile $profile
ecs-cli ps --cluster-config $config_name --ecs-profile $profile
fi
