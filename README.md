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
Welcome to the sample script, Bountiful Bill! We see that you have these
bounties already in your inventory:
  - Kill A Buncha Dregs
  - Kill A Buncha Guardians
  - Kill 10 Combatants With Solar Abilities

The following bounties can be done *anywhere*, so we recommend you pick them up
regardless of your plans for the day, unless they just don't look fun to you.
  - Get 10 Precision Kills (purchase from Zavala)
  - Get 8 Kills with a Pulse Rifle (purchase from Banshee)
  - Get 32.5 Kills with a Rocket Launcher (purchase from Banshee)

To optimize your bounty completions today, we recommend you do the following
activities in this order. Note that some of the bounties can be completed in
more than one step.
Seraph Shield
  - Kill A Buncha Dregs (already in inventory)
  - Kill 10 Combatants With Solar Abilities (already in inventory)
  - Kill 100 Combatants in Seasonal Activities (purchase from Clovis's Torso)
  - Pick Up Three Seasonal Doodads (purchase from Clovis's Torso)
  - Oh My God More Currencies Why (purchase from Clovis's Torso)
  - Taunt A Wizard (purchase from Eris)
  - Pee On A Hive Knight (purchase from Eris)
Vanguard Ops
  - Kill A Buncha Dregs (already in inventory)
  - Kill 10 Combatants With Solar Abilities (already in inventory)
  - Sniper Kills In Strikes (purchase from Zavala)
  - Taunt A Wizard (purchase from Eris)
  - Pee On A Hive Knight (purchase from Eris)
Crucible
  - Kill A Buncha Guardians (already in inventory)
  - Grenade Kills In Crucible (purchase from Shaxx)
  - Teabag A Streamer (purchase from Twitch)
Gambit
  - Kill A Buncha Guardians (already in inventory)
  - Kill 10 Combatants With Solar Abilities (already in inventory)
  - Teabag A Streamer (purchase from Twitch)
Delivering Cookies
  - Deliver Eighty Billion Cookies (purchase from Eva)
  - Ok Now Eighty Billion More Cookies (purchase from Eva)
  - Win The Great Guardian Bake-Off (purchase from Eva)

Feel free to skip any you don't care for, of course. Have fun!
```

The idea is that roughly this information could be kept open on a web page or
mobile app of some sort while the player went down the list of activities, and
could auto-update as bounties were completed, perhaps changing activity
priorities along the way.
