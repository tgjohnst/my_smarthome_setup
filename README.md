# My connected home setup
Documentation for IoT/smarthome devices and setup so I don't later forget what I did

Right now this is just stream of consciousness, I'll beautify it later



## Networking

Existing setup


| Device                           | Function               | Notes |
| -------------------------------- | ---------------------- | ----- |
| Netgear CM1000                   | Cable Modem            |       |
| Netgear R6400                    | Wifi Router            |       |
| Raspberry Pi B+                  | Pihole DNS/DHCP server |       |
| Synology DS1019+                 | Server, NAS            |       |
| Cyberpower CP1500PFCLCD Sinewave | UPS                    |       |

New Setup:

| Device                            | Function                              | Notes |
| --------------------------------- | ------------------------------------- | ----- |
| Netgear CM1000                    | Cable Modem /                         |       |
| Ubiquiti Dream Machine Pro        | Gateway, Router, Firewall, Controller |       |
| Ubiquiti UniFi Switch Lite 16 PoE | PoE-out switch (network cabinet)      |       |
| Ubiquiti UniFi Switch Flex Mini   | PoE switch (media center)             |       |
| Ubiquiti UniFi NanoHD AP (2)      | WiFi Access Points                    |       |
| TUFFIOM 12U Network Enclosure     | Equipment Rack                        |       |
| Raspberry Pi B+                   | Pihole DNS/DHCP server                |       |
| Synology DS1019+                  | Server, NAS                           |       |
| Cyberpower CP1500PFCLCD Sinewave  | UPS                                   |       |





## IoT devices

| Nickname                | Device                  | Location    | Category               | Brand       | Protocol          | Hub?        | Setup? |
| ----------------------- | ----------------------- | ----------- | ---------------------- | ----------- | ----------------- | ----------- | ------ |
|                         | Ultraloq Combo          | Front door  | Security               | Ultraloq    | UL Hub Wifi       | UL Hub      |        |
|                         | 2k Wired Video Doorbell | Front door  | Security               | Eufy        | Direct Wifi       |             |        |
| Chrome Sparks           | Chromecast 2            | Living Room | Media                  | Google      | Direct Wifi       |             |        |
| Chrome Suds             | Google Home             | Master Bath | Smart Speaker          | Google      | Direct Wifi       |             |        |
| Chrome Snores           | Nest Hub                | Master Bed  | Smart Speaker          | Google      | Direct Wifi       |             |        |
| Chrome Hub              | Nest Hub Max            | Kitchen     | Smart Speaker + Camera | Google      | Direct Wifi       |             |        |
|                         | Nest Hub                | Office      | Smart Speaker          | Google      | Direct Wifi       |             |        |
|                         | Nest Mini               | Lower Bath  | Smart Speaker          | Google      | Direct Wifi       |             |        |
|                         | Google Home Mini        | Roof Deck   | Smart Speaker          | Google      | Direct Wifi       |             |        |
|                         | Steam Link              | Living Room | Gaming                 | Valve       | Wired             |             |        |
|                         | RoboRock S4             | Main        | Vacuum                 | RoboRock    | Direct Wifi       |             |        |
|                         | Neato XV21              | Lower       | Vacuum                 | Neato       | None              |             |        |
| Australis               | Nanoleaf Aurora         |             | Lighting               | Nanoleaf    | Direct Wifi       |             |        |
| Borealis                | Nanoleaf Aurora         |             | Lighting               | Nanoleaf    | Direct Wifi       |             |        |
|                         | Nanoleaf Canvas         |             | Lighting               | Nanoleaf    | Direct Wifi       |             |        |
|                         | Hue Bridge              | Living Room | Lighting               | Philips Hue | Wired/Zigbee      |             |        |
| Death Star              | Hue A19 Color           |             | Lighting               | Philips Hue | Zigbee Light Link | Hue Bridge  |        |
|                         | Hue A19 Color           |             | Lighting               | Philips Hue | Zigbee Light Link | Hue Bridge  |        |
|                         | Hue A19 Color           |             | Lighting               | Philips Hue | Zigbee Light Link | Hue Bridge  |        |
|                         | Hue A19 Color           |             | Lighting               | Philips Hue | Zigbee Light Link | Hue Bridge  |        |
|                         | Hue A19 White           |             | Lighting               | Philips Hue | Zigbee Light Link | Hue Bridge  |        |
|                         | Hue A19 White           |             | Lighting               | Philips Hue | Zigbee Light Link | Hue Bridge  |        |
|                         | Hue A19 White           |             | Lighting               | Philips Hue | Zigbee Light Link | Hue Bridge  |        |
|                         | Insteon Hub             | Living Room | Lighting               | Insteon     | Wired/Insteon     |             |        |
| Balcony Outside Light   | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Bedroom Light           | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Beverage Cooler         | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Closset Light           | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Dining Light            | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Downstairs Bedroom      | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Front Outside Light     | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Kitchen Island Pendants | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Kitchen Lights          | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Kitchen Under Counter   | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Lounge Lights           | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Lounge Reading Lamp     | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Nightstand Lights       | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Spare On/Of             |                         |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| TV Lounge Light         | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| TV Outside Light        | Wall Switch             |             | Lighting               | Insteon     | Insteon           | Insteon Hub |        |
| Water Leak Sensor       |                         |             | Sensor                 |             |                   | Insteon Hub |        |



TODOS

where to put hubs here?

How to annotate what's connected to what? network diagram?

Add pictures with which switch is which?

Add VLAN annotations
