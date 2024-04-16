# fivem_radargun
Working DUI runtime police radar gun with add-on 3D model 

Showcase: https://streamable.com/o3u1bo

## Description
This script simulates realistic police radar gun. With the help of fivem Direct-rendered UI system I made it possible to apply car speed and distance from the player to 3D radar gun model. This script will probably have some minor updates so watch out for them.


**Config settings:**

**CONFIG.REFRESH_RATE** - Determines how fast it updates. Adjust it to the speed of cars in your servers. I personally recommend something between 100-200.

**CONFIG.USE_MPH** - If set to true the speed will be calculated to show MPH values otherwise it will display KMH.

**CONFIG.SPEED_MEASURE_UNIT** - Whatever you type in here will be displayed on radar gun screen. (e.g. "MPH" or "KMH")

**CONFIG.DISTANCE_MEASURE_UNIT** - Whatever you type in here will be displayed on radar gun screen. (e.g. "FT" or "M")

**CONFIG.RANGE** - Determines how far radar gun should detect vehicles. Setting higher values might not work because of fivem limitations. Recommend something around 55.
## Installation
```
1. Download latest version of the script
2. Drag and drop it in your resource folder
3. Ensure it in server.cfg
```
#### if you are using ox_inventory add these following lines to ox_inventory/data/weapons.lua
```lua
['WEAPON_RADARGUN'] = {
	label = 'Radar',
	weight = 250,
	durability = 0.1,
},
```
## Author
Script: https://github.com/Krisuniooo

3D model: https://github.com/Krisuniooo

If you have any questions DM me on my discord: krisuniooo
