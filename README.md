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
  - In the Zone
  - Power Up
  - The Nothing

The following bounties can be done *anywhere*, so we recommend you pick them up
regardless of your plans for the day, unless they just don't look fun to you.
  - Stasis Calibration (purchase from Banshee-44)
  - Linear Fusion Rifle Calibration (purchase from Banshee-44)
  - Fusion Rifle Calibration (purchase from Banshee-44)
  - Trace Rifle Calibration (purchase from Banshee-44)
  - Seraph Stasis (purchase from Rasputin's Torso)
  - Seraph Front-Liner (purchase from Rasputin's Torso)

To optimize your bounty completions today, we recommend you do the following
activities in this order. Note that some of the bounties can be completed in
more than one step. The 'efficiency' is based on how many bounties are
available for that activity, and how easily they can be completed there. For
example, Vangaurd Ops is great for weapon bounties, but you might not want to
take an unfamiliar loadout into Trials.
Vanguard Ops (efficiency: 22)
  - Rocketing to Prominence (purchase from Zavala)
  - Long Distance Plan (purchase from Zavala)
  - Stasis Calibration (purchase from Banshee-44)
  - Linear Fusion Rifle Calibration (purchase from Banshee-44)
  - Fusion Rifle Calibration (purchase from Banshee-44)
  - Trace Rifle Calibration (purchase from Banshee-44)
  - Seraph Spellbreaker (purchase from Rasputin's Torso)
  - Seraph Front-Liner (purchase from Rasputin's Torso)
Crucible (Quickplay) (efficiency: 18)
  - In the Zone (already in inventory)
  - Power Up (already in inventory)
  - The Nothing (already in inventory)
  - Coordinated Fire (purchase from Shaxx)
  - Stasis Calibration (purchase from Banshee-44)
  - Linear Fusion Rifle Calibration (purchase from Banshee-44)
  - Fusion Rifle Calibration (purchase from Banshee-44)
  - Trace Rifle Calibration (purchase from Banshee-44)
  - Seraph Front-Liner (purchase from Rasputin's Torso)
Trials of Osiris (efficiency: 15)
  - Power Up (already in inventory)
  - The Nothing (already in inventory)
  - Coordinated Fire (purchase from Shaxx)
  - Stasis Calibration (purchase from Banshee-44)
  - Linear Fusion Rifle Calibration (purchase from Banshee-44)
  - Fusion Rifle Calibration (purchase from Banshee-44)
  - Trace Rifle Calibration (purchase from Banshee-44)
  - Seraph Front-Liner (purchase from Rasputin's Torso)
Seraph Shield (efficiency: 11)
  - Stasis Calibration (purchase from Banshee-44)
  - Linear Fusion Rifle Calibration (purchase from Banshee-44)
  - Fusion Rifle Calibration (purchase from Banshee-44)
  - Trace Rifle Calibration (purchase from Banshee-44)
  - Seraph Spellbreaker (purchase from Rasputin's Torso)
  - Seraph Front-Liner (purchase from Rasputin's Torso)
Gambit (efficiency: 10)
  - Power Up (already in inventory)
  - The Nothing (already in inventory)
  - Coordinated Fire (purchase from Shaxx)
  - Stasis Calibration (purchase from Banshee-44)
  - Linear Fusion Rifle Calibration (purchase from Banshee-44)
  - Fusion Rifle Calibration (purchase from Banshee-44)
  - Trace Rifle Calibration (purchase from Banshee-44)
  - Seraph Spellbreaker (purchase from Rasputin's Torso)
  - Seraph Front-Liner (purchase from Rasputin's Torso)
Heists (efficiency: 8)
  - Stasis Calibration (purchase from Banshee-44)
  - Linear Fusion Rifle Calibration (purchase from Banshee-44)
  - Fusion Rifle Calibration (purchase from Banshee-44)
  - Trace Rifle Calibration (purchase from Banshee-44)
  - Seraph Spellbreaker (purchase from Rasputin's Torso)
  - Seraph Front-Liner (purchase from Rasputin's Torso)

Feel free to skip any you don't care for, of course, and have fun!
```

The idea is that roughly this information could be kept open on a web page or
mobile app of some sort while the player went down the list of activities, and
could auto-update as bounties were completed, perhaps changing activity
priorities along the way.
