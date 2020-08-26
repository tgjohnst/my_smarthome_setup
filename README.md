# My connected home setup
Documentation for IoT/smarthome devices and network setup so I don't later forget what I did

This is a work in progress as I build out my network

## Networking

I have a Ubiquiti network setup with 50+ IoT devices.
[Here's how I set up my network](Networking/network_setup_notes.md)

TODO - this will be filled out with much more detail soon

## Home Media Server

I have a Synology DS1019+ NAS with 32TB of redundant storage (4 8TB WD Reds). It's set up in SHR-1 RAID, which means that it can recover even if 1 drive fails, and can be expanded flexibly. 

[Here's how I set up my NAS](NAS/nas_setup_notes.md)

This NAS also serves as a home server, running a bunch of web services I can access while on my network.
When combined, these allow me to
- Have a unified homepage that contains every web service I'm running on my home network
- Monitor and manage these services themselves
- Stream media to any of my devices via a netflix-like interface and app
- Automatically organize, catalog, manage, and fetch media (movies, TV, music, books)

[Here are the services I run on my NAS](NAS/docker_services.md)
