echo "Swapping code into service folder and activated service"
echo "copy $1 --> $2"

mkdir -p $2

echo "created/modified $2"

echo "copy service file to systemd/system folder"
sudo -s cp $1/init_scripts/systemd_configs/nearfield.management.api.service /etc/systemd/system/nearfield.management.api.service sudo -s cp $1/init_scripts/systemd_configs/nearfield.tentacle.server.service /etc/systemd/system/nearfield.tentacle.server.servi$

echo "stopping services"
sudo -s systemctl stop nearfield.management.api.service
sudo -s systemctl stop nearfield.tentacle.server.service

cp -r $1/. $2
echo "copied $1 to $2"

echo "starting services"
sudo -s systemctl start nearfield.management.api.service
sudo -s systemctl start nearfield.tentacle.server.service

echo "done swapping code into service folder and successfully activated service"