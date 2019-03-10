echo "Swapping code into service folder and activated service"
echo "copy $1 --> $2"

mkdir -p $2

echo "created/modified $2"

echo "copy service file to systemd/system folder"
sudo -s cp $1/init_scripts/systemd_configs/management.api.service /etc/systemd/system/management.api.service
sudo -s cp $1/init_scripts/systemd_configs/management.api.service /etc/systemd/system/tentacle.server.service

echo "stopping services"
sudo -s systemctl stop management.api.service
sudo -s systemctl stop tentacle.server.service

cp -r $1/. $2
echo "copied $1 to $2"

echo "starting services"
sudo -s systemctl start management.api.service
sudo -s systemctl start tentacle.server.service

echo "done swapping code into service folder and successfully activated service"