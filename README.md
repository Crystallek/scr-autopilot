<h1 align="center">🚄 SCR Autopilot</h1>
<p align="center">A fully automatic Autopilot for a Roblox game named Stepford County Railway.</p>

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
    - KRNL (https://krnl.place, Free)
    - Synapse X (https://x.synapse.to/, Paid)
  - Inject it into running Roblox Player
  - Execute the script, a basic UI will show up
  - Set the max speed of your train
  - Spawn a train
  - Turn an Autopilot on
  - You are good to go!
## ℹ️ Information
  The Roblox window has to be maximized and focused, else the train will not brake or speed up. This is because it uses a keypress() function, which is basically an executor pressing keys for us. I wanted to use a VirtualUser key presses, but SCR blocks it. You can disable a Train HUD though by pressing Shift + G, it can actually read data from the UI even if not visible.
  
  An autopilot was coded to work on version 1.9.7. That means a future updates can make a script unusable. I will try to maintain it, but I will not promise anything.

## 🐛 Known bugs
  - Bad stop at Morganstown (Connect only), it breaks because there is a Waterline buffer closer to us than the buffer on our track. The script can differenciate the buffers, so it tries to stop to the closest one
  - Bad stop at Benton (Waterline, terminating trains only), I do not know why it happens, i will look into it later. For now you can use SV <> Beechley route for grinding

## 💻 Future updates
  - Optimalisation
  - Bad stop handler for terminating platforms (Through platforms have this already, will fix those 2 known bugs)

## ❓ Fun fact
  - First prototype was made in 4 hours.

## 🌐 Discord
  - https://discord.gg/UvY8vKFe
  - https://discord.gg/3pY4rbgg

## 👨‍💻 Creators:
- [Crystallek#3348] - Programmer (https://github.com/Crystallek)
- [Take#8559] - Tester (https://github.com/takoda121)
