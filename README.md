# Bounty Buddy

This is just a cheap and cheerful prototype of some bounty optimization logic
for the video game Destiny 2. It consists of a few libraries implementing a
bounty prioritization scheme and a sample script to show how those libraries
might be used. You should just be able to run the sample script from the
command line, like so:

```bash
ruby bin/sample.rb
```

However, the output is static, so I can save you the trouble. Here's what it prints out:

```
Welcome to the sample script, Bountiful Bill! We see that you have these bounties already in your inventory:
  - Kill A Buncha Dregs
  - Kill A Buncha Guardians
  - Get 10 Precision Kills

The following bounties can be done *anywhere*, so we recommend you pick them up regardless of your plans for the day, unless they just don't look fun to you.
  Already in inventory:
    - Get 10 Precision Kills
  Purchase from Banshee:
    - Get 8 Kills with a Pulse Rifle
    - Get 32.5 Kills with a Rocket Launcher

To optimize your bounty completions today, we recommend you do the following activities in this order. Note that some of the bounties can be completed in more than one step.
Seraph Shield
  Already in inventory:
    - Kill A Buncha Dregs
  Purchase from Clovis's Torso:
    - Pulse Rifle Kills in Seasonal Activities
    - Pick Up Three Seasonal Doodads
    - Oh My God More Currencies Why
  Purchase from Eris:
    - Taunt A Wizard
    - Pee On A Hive Knight
Vanguard Ops
  Already in inventory:
    - Kill A Buncha Dregs
  Purchase from Zavala:
    - Sniper Kills In Strikes
  Purchase from Eris:
    - Taunt A Wizard
    - Pee On A Hive Knight
Crucible
  Already in inventory:
    - Kill A Buncha Guardians
  Purchase from Shaxx:
    - Grenade Kills In Crucible
  Purchase from Twitch:
    - Teabag A Streamer
Delivering Cookies
  Purchase from Eva:
    - Deliver Eighty Billion Cookies
    - Ok Now Eighty Billion More Cookies
    - Win The Great Guardian Bake-Off
Gambit
  Already in inventory:
    - Kill A Buncha Guardians
  Purchase from Twitch:
    - Teabag A Streamer

Feel free to skip any you don't care for, of course. Have fun!
```

The idea is that roughly this information could be kept open on a web page or
mobile app of some sort while the player went down the list of activities, and
could auto-update as bounties were completed, perhaps changing activity
priorities along the way.
