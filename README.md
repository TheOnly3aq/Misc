# Vroom's Miscellaneous Scirpts (VMS)

### This script includes:

- /train to spawn train (ace restricted)
- /lp to lockpick a vehicle (Modified version of [this repo](https://github.com/TwisleOfficial/SimpleLockpick/tree/main))
- /unlock to force unlock a vehicle (ace restricted)
- /goto command (ace group)
- /bring command (ace group)
- /fuel command (Only works with ND Framework, and is ace restricted)
- /charge command (Only works with ND Framework, only works at charge locations and with electric cars.) 
- Tesla Charger ymap (From [here](https://github.com/wtf-fivem-mods/wtf_tesla_supercharger))
- Engine stall on collison script ([original post](https://forum.cfx.re/t/free-standalone-engine-stalling-on-vehicle-collision/5194284/1))
- Ped spawner script (original [repo](https://github.com/Fiffers/ped_spawner))


You can edit the ace permission, as well as other configs in `shared/config.lua`

Most of these scripts are made by other people, and some I've made myself. I was tired of having multiple scripts taking up multiple resources so I made it all in one. Hope you enjoy

### Dependencies
 
- [ND_Fuel](https://github.com/ND-Framework/ND_Fuel)
- [Ox_Lib](https://github.com/overextended/ox_lib)
- [qb-lock](https://github.com/Tex27/qb-lock) (Make sure to remove `exports['qb-lock']:` on line 7 in `client/client.lua`!)