
# SSH_NEARFIELD_IP can be set as an environment variable: "export SSH_NEARFIELD_UP=ip"
# SSH_NEARFILD_USER can be set as an environment variable: "export SSH_NEARFIELD_USER=user"
SSH_NEARFIELD_PASSWORD ?= $(shell bash -c 'read -s -p "Password: " pwd; echo $$pwd')

.PHONY: deploy build build-management-webapi build-tentacle-server copy-init-scripts

build: build-management-webapi build-tentacle-server copy-init-scripts

build-management-webapi:
	 cd ../../src/NearField.Management.WebApi && dotnet.exe publish -r linux-arm -o ../../publish/management-webapi

build-tentacle-server:
	 cd ../../src/NearField.TentacleServer && dotnet.exe publish -r linux-arm -o ../../publish/tentacle-server

copy-init-scripts:
	cd ../ && mkdir -p ../publish/init_scripts && cp -r init_scripts ../publish

deploy:
	@cd ../deploy_scripts/ && ./deploy_to_raspberry_pi.sh $(SSH_NEARFIELD_USER) $(SSH_NEARFIELD_PASSWORD) $(SSH_NEARFIELD_IP)