# deploy code to staging
echo "deploy with $1@$2:$3"

staging_folder="$3_staging"
rsync --delete -r ../../publish/* $1@$2:$staging_folder

echo "code deployed successfully to staging folder"

ssh $1@$2 sh $staging_folder/init_scripts/swap_staging_to_service_folder.sh

echo "successfull activated new deploy"