<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="center">


# MISC

<em>Elevate your gameplay with seamless, immersive experiences.</em>

<!-- BADGES -->
<img src="https://img.shields.io/github/last-commit/TheOnly3aq/Misc?style=flat&logo=git&logoColor=white&color=0080ff" alt="last-commit">
<img src="https://img.shields.io/github/languages/top/TheOnly3aq/Misc?style=flat&color=0080ff" alt="repo-top-language">
<img src="https://img.shields.io/github/languages/count/TheOnly3aq/Misc?style=flat&color=0080ff" alt="repo-language-count">

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/Lua-2C2D72.svg?style=flat&logo=Lua&logoColor=white" alt="Lua">

</div>
<br>

---

## Overview

Vroom's Miscellaneous Scripts (VMS) is a powerful toolkit designed to elevate the gameplay experience in GTA V by integrating a variety of essential functionalities. 

### 📢 Real-time Announcements
Facilitate in-game communication with dynamic message broadcasting.  
- Integrated with the [Setro Announce System](https://forum.cfx.re/t/release-setro-announce-announcements-system-with-visuals-that-stand-out-and-sound-fixed-bug/130731)

### 🚗 Vehicle Management
Streamline vehicle interactions with customizable commands and fuel mechanics.
- `/lp` – Lockpick a vehicle (Modified version of [SimpleLockpick](https://github.com/TwisleOfficial/SimpleLockpick/tree/main))
- `/unlock` – Force unlock a vehicle (ACE restricted)
- 50% chance AI cars are locked/unlocked (no more breaking AI car windows)
- `/fuel` – ND Framework support only (ACE restricted)
- `/charge` – ND Framework support only, usable at charge stations and with electric cars

### 🔒 Permission Management
Ensure secure access control for players and admins.
- `/goto` – Teleport to a player (ACE restricted)
- `/bring` – Bring a player to you (ACE restricted)

### 🚂 Dynamic Gameplay Enhancements
Introduce unpredictability and realism to in-game behavior.
- `/train` – Spawn train (ACE restricted)
- `/randomtrain on/off` – Toggle random train spawns
- Engine stall on vehicle collision ([original script](https://forum.cfx.re/t/free-standalone-engine-stalling-on-vehicle-collision/5194284/1))
- Flashlight stays on even when not aiming
- All cop cars removed for a cleaner world

### 🧍 Pedestrian Spawner
- Easily spawn NPCs using the [ped spawner script](https://github.com/Fiffers/ped_spawner)

### ⚡ Tesla Supercharger YMAP
- Adds immersive charging stations using assets from [wtf_tesla_supercharger](https://github.com/wtf-fivem-mods/wtf_tesla_supercharger)

---

### Dependencies
 
- [ND_Fuel](https://github.com/ND-Framework/ND_Fuel)
- [Ox_Lib](https://github.com/overextended/ox_lib)
- [qb-lock](https://github.com/Tex27/qb-lock) (Make sure to remove `exports['qb-lock']:` on line 7 in `client/client.lua`!)


<div align="left"><a href="#top">⬆ Return</a></div>
