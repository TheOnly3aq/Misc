# Vroom's Miscellaneous Scirpts (VMS)

### This script includes:

- /train to spawn train (ace restricted)
- /randomtrain on/off - Set random train spawning on or off
- /lp to lockpick a vehicle (Modified version of [this repo](https://github.com/TwisleOfficial/SimpleLockpick/tree/main))
- /unlock to force unlock a vehicle (ace restricted)
- /goto command (ace group)
- /bring command (ace group)
- /fuel command (Only works with ND Framework, and is ace restricted)
- /charge command (Only works with ND Framework, only works at charge locations and with electric cars.) 
- /announce command (Original (forum post)[https://forum.cfx.re/t/release-setro-announce-announcements-system-with-visuals-that-stand-out-and-sound-fixed-bug/130731])
- Tesla Charger ymap (From [here](https://github.com/wtf-fivem-mods/wtf_tesla_supercharger))
- Engine stall on collison script ([original post](https://forum.cfx.re/t/free-standalone-engine-stalling-on-vehicle-collision/5194284/1))
- Ped spawner script (original [repo](https://github.com/Fiffers/ped_spawner))
- 50% chance that ai cars are locked/unlocked + no more breaking ai car windows
- Flashlight always on (flashlight won't go off when you stop aiming your gun)
- Remove all cop cars

You can edit the ace permission, as well as other configs in `shared/config.lua`

Some of these scripts are made by other people, some are made by me. I've added these all together because I got tired of scripts taking up too much resources, 
so adding them into one just sounded like a good idea. There's also just code in here that I thought of would be cool/usefull. 

### TODO:
- Better config, make it so you can disable each feature individually. 
- More cool features!

### Dependencies
 
- [ND_Fuel](https://github.com/ND-Framework/ND_Fuel)
- [Ox_Lib](https://github.com/overextended/ox_lib)
- [qb-lock](https://github.com/Tex27/qb-lock) (Make sure to remove `exports['qb-lock']:` on line 7 in `client/client.lua`!)