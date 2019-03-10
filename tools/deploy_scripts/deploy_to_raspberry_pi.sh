echo "deploy with $1@$2:$3"

staging_folder="$3_staging"
service_folder="$3_service"

ssh -t $1@$2 "sudo mkdir -p $staging_folder; sudo mkdir -p $service_folder; sudo chown -R $1 $staging_folder; sudo chgrp -R $1 $service_folder; sudo chown -R $1 $service_folder; sudo chgrp -R $1 $staging_folder;"

rsync --delete -r ../../publish/* $1@$2:$staging_folder

echo "code deployed successfully to staging folder"

ssh -t $1@$2 sh $staging_folder/init_scripts/swap_staging_to_service_folder.sh $staging_folder $service_folder

echo "successful activated new deploy"
