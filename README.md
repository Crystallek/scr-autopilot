<h1 align="center">🚄 SCR Autopilot 🚄</h1>
<p align="center">A fully automatic autopilot for a Roblox game named Stepford County Railway.</p>
<p align="center">https://www.roblox.com/games/696347899/</p>

## ⚙️ Functions:
  - Signal value handler 🚦
    - Proceed - Max throttle applied
    - Caution - Slow down
    - Danger - Stop
  - Station handler 🚉
    - Automatically stops close to the signal
    - Automatically opens the doors
    - Automatically closes the doors
    - Automatically leaves the station
    - Automatic schedule continuing
    - Buffer station support
  - Guard/Dispatcher support 💂‍♂️
  - Auto AWS 🌻
## 🖥️ Set up
  - Download a Lua executor
    - KRNL (https://fluxteam.net/, Free)
    - Script-Ware (https://script-ware.com/, Paid)
  - Inject it into running Roblox Player
  - Execute the script (copy scr.lua file and paste it to an executor), a basic UI will show up
  - Set the max speed of your train
  - Spawn a train
  - Turn an Autopilot on
  - You are good to go!
## ℹ️ Information
  The Roblox window has to be maximized and focused, else the train will not brake or speed up. This is because it uses a keypress() function, which is basically an executor pressing keys for us. I wanted to use a VirtualUser key presses, but SCR blocks it. You can disable a Train HUD though by pressing Shift + G, it can actually read data from the UI even if not visible.
  
  An autopilot was coded to work on version 1.9.7. That means a future updates can make a script unusable. I will try to maintain it, but I will not promise anything.
  
  And for the best functionality, i recommend to use an interior camera (Train cabin).

## 🐛 Known bugs
  - None

## 💻 Future updates
  - Optimalisation
  - Bad stop handler for terminating platforms (Through platforms have this already, will fix those 2 known bugs)

## ❓ Fun fact
  - First prototype was made in 4 hours.

## 🌐 Discord
  - https://discord.gg/N4HHk3D8Qd

## 👨‍💻 Contributors:
- [Crystallek#3348] - Owner (https://github.com/Crystallek)
- [Take#9044](https://discord.com/users/1075053921044799518) - ReadMe Edit, Tester  [His github](https://github.com/takoda121)
