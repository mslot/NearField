
# SSH_NEARFILD_USER can be set as an environment variable: "export SSH_NEARFIELD_USER=user"
SSH_NEARFIELD_PASSWORD ?= $(shell bash -c 'read -s -p "Password: " pwd; echo $$pwd')

.PHONY: deploy build build-management-webapi

build: build-management-webapi

build-management-webapi:
	 cd ../../src/NearField.Management.WebApi && dotnet.exe publish

deploy:
	@cd ../deploy_scripts/ && ./deploy_to_raspberry_pi.sh $(SSH_NEARFIELD_USER) $(SSH_NEARFIELD_PASSWORD)