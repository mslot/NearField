# PREAMBLE
I need to be able to turn off and on my Hue lights by simply being near a beacon with my phone. I have done some PoCs (that I have kept for my self), but now I am ready to structure it a bit more (hence this project).

It is going to be divided up in two (actually three parts):

1. A mobile that can detect whenever I am near a beacon
2. A HTTP API that can pass by my commands to,
3. a server that listens to for incoming requests, and acts upon this (in the future this is going to be extendable, so therefore it is named ... Tentacle server ... uuuh fancy)

All written in .NET core. The HTTP API and server is hosted on a Raspberry Pi. The beacons is Estimotes for now, but I want to try out some other manufactures as well.

DO NOTE that I haven't committed any code yet to this repo (other than the templates), but I have made an entire PoC that proves that I am able to do what I want ... Sort of (you have to have the app open, but that is fine for now :). In the following weeks and months I will structure my PoC and make it public bit by bit.

My first task though, is to make it easily deployable and testable on the Raspberry Pi.

# DEPLOY
To make a deploy to the Raspberry Pi set the following three environment variables:

1. DEPLOY_NEARFIELD_IP - the IP of the Raspberry Pi
2. DEPLOY_NEARFIELD_USER  - the ssh user to login to the Raspberry Pi
3. DEPLOY_NEARFIELD_DEST_FOLDER - the destination folder

Notice to 3) is that two folders is created:

1. [folder_name]_staging - this is the staging folder where the new files is copied before getting swapped with _service folder
2. [folder_name]_service - the active folder where systemd is pointed

For now you have to pass in your password twice in the deploy process. I am not a commandline wizard, and I haven't got time for creating the relevant files for doing it without password (but you could do it if it annoys you).

To build and deploy, do the following:

1. set the above environment variables
2. cd into the tools/deploy_scripts and
3. run ```make``` - this will build and deploy

If you only want to build:

1. run ```make build```

If you only want to deploy:

1. run ```make deploy``` - be sure to publish to the publish/ folder that is a sibling of the src/ folder

