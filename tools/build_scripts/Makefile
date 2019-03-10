# DEPLOY_NEARFIELD_IP can be set as an environment variable: "export DEPLOY_NEARFIELD_IP=ip"
# DEPLOY_NEARFIELD_USER can be set as an environment variable: "export DEPLOY_NEARFIELD_USER=user"
# DEPLOY_NEARFIELD_DEST_FOLDER can be set as an environment variable: "export DEPLOY_NEARFIELD_DEST_FOLDER=folder"

.PHONY: clean deploy build build-management-webapi build-tentacle-server copy-init-scripts

build: clean build-management-webapi build-tentacle-server copy-init-scripts deploy

build-management-webapi:
	 cd ../../src/NearField.Management.WebApi && dotnet.exe publish -r linux-arm -o ../../publish/management-webapi

build-tentacle-server:
	 cd ../../src/NearField.TentacleServer && dotnet.exe publish -r linux-arm -o ../../publish/tentacle-server

copy-init-scripts:
	cd ../ && mkdir -p ../publish/init_scripts && cp -r init_scripts ../publish

deploy:
	@cd ../deploy_scripts/ && ./deploy_to_raspberry_pi.sh $(DEPLOY_NEARFIELD_USER) $(DEPLOY_NEARFIELD_IP) $(DEPLOY_NEARFIELD_DEST_FOLDER) $(RSYNC_PASSWORD)

clean:
	cd ../../ && rm -rf publish/