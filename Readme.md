I need to be able to turn off and on my Hue lights by simply being near a beacon with my phone. I have done some PoCs (that I have kept for my self), but now I am ready to structure it a bit more (hence this project).

It is going to be divided up in two (actually three parts):

1. A mobile that can detect whenever I am near a beacon
2. A HTTP API that can pass by my commands to,
3. a server that listens to for incoming requests, and acts upon this (in the future this is going to be extendable, so therefore it is named ... Tentacle server ... uuuh fancy)

All written in .NET core. The HTTP API and server is hosted on a Raspberry PI. The beacons is Estimotes for now, but I want to try out some other manufactures as well.