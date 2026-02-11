local addonName = "SausageStrats"
local SS = CreateFrame("Frame", "SausageStratsFrame", UIParent)

SausageStratsDB = SausageStratsDB or {}

-- =========================================================================
-- 1. STRATEGY DATABASE (NAXXRAMAS & DUNGEONS)
-- =========================================================================

local DB = {
    -- === NAXXRAMAS ===
    naxx = {
        { name = "Anub'Rekhan", 
          t10 = { 
            GENERAL="Boss spawns Crypt Guards - kill them first. During 'Locust Swarm', the Tank must run (kite) along the wall. Do not stand in front of the boss (Impale).",
            TANK="Kite along perimeter during Locust Swarm.", HEAL="Heal tank on run. Watch Impale.", MDPS="Kill Crypt Guards. Run from Swarm.", RDPS="Focus Crypt Guards. Spread out." 
          },
          t25 = { 
            GENERAL="Boss spawns Crypt Guards - kill them first. During 'Locust Swarm', the Tank must run (kite) along the wall. Do not stand in front of the boss (Impale).",
            TANK="Kite along perimeter during Locust Swarm.", HEAL="Heal tank on run. Watch Impale.", MDPS="Kill Crypt Guards. Run from Swarm.", RDPS="Focus Crypt Guards. Spread out." 
          }
        },
        { name = "Grand Widow Faerlina", 
          t10 = { 
            GENERAL="Don't stand in Rain of Fire. Kill adds near the boss (cleave). Dispel Poison. When she Enrages, heal through it or sacrifice an add.",
            TANK="MT Boss, OT Adds. Burn boss.", HEAL="Heal Rain of Fire dmg.", MDPS="Nuke boss. Don't stand in fire.", RDPS="Nuke boss. Don't stand in fire." 
          },
          t25 = { 
            GENERAL="Don't stand in Rain of Fire. Priest must Mind Control a Worshipper add and use 'Embrace' to silence the boss's Enrage (every ~60s).",
            TANK="MT Boss, OT Adds. Priest MC add to silence Enrage.", HEAL="Heal Rain of Fire. Big heal if Enrage hits.", MDPS="Nuke boss. Don't kill MC target.", RDPS="Nuke boss. Stop DPS on MC target." 
          }
        },
        { name = "Maexxna", 
          t10 = { 
            GENERAL="Boss stuns everyone for 6s (Web Spray) every 40s. Adds spawn often - kill them. If someone gets Web Wrapped on the wall, break them out immediately.",
            TANK="Defensives before Web Spray.", HEAL="Top raid before Web Spray.", MDPS="Kill spiders. Break Web Wrap.", RDPS="Kill Web Wrap ASAP." 
          },
          t25 = { 
            GENERAL="Boss stuns everyone for 6s (Web Spray) every 40s. Adds spawn often - kill them. If someone gets Web Wrapped on the wall, break them out immediately.",
            TANK="Defensives before Web Spray.", HEAL="Top raid before Web Spray.", MDPS="Kill spiders. Break Web Wrap.", RDPS="Kill Web Wrap ASAP." 
          }
        },
        { name = "Noth the Plaguebringer", 
          t10 = { 
            GENERAL="Decurse the raid immediately or you wipe! Boss teleports to balcony - kill adds during this phase. Don't stand near the tank (Cleave).",
            TANK="Pick up adds.", HEAL="Decurse immediately!", MDPS="Kill adds on balcony phase.", RDPS="Kill adds. Decurse." 
          },
          t25 = { 
            GENERAL="Decurse the raid immediately or you wipe! Boss teleports to balcony - kill adds during this phase. Don't stand near the tank (Cleave).",
            TANK="Pick up adds.", HEAL="Decurse immediately!", MDPS="Kill adds on balcony phase.", RDPS="Kill adds. Decurse." 
          }
        },
        { name = "Heigan the Unclean", 
          t10 = { 
            GENERAL="The floor is lava! When lava erupts, move to the safe zone (1, 2, 3, 4). On the platform, stand together. Don't interrupt the dance.",
            TANK="Dance safely.", HEAL="Dance! Cast instants.", MDPS="Dance! Follow tank.", RDPS="Dance! Stay on platform." 
          },
          t25 = { 
            GENERAL="The floor is lava! When lava erupts, move to the safe zone (1, 2, 3, 4). On the platform, stand together. Don't interrupt the dance.",
            TANK="Dance safely.", HEAL="Dance! Cast instants.", MDPS="Dance! Follow tank.", RDPS="Dance! Stay on platform." 
          }
        },
        { name = "Loatheb", 
          t10 = { 
            GENERAL="Healers can only heal for 3 seconds every minute! DPS must kill Spores to get a massive Crit buff. Bandage yourself if low.",
            TANK="Tank center.", HEAL="Heal only every 60s (3s window).", MDPS="Kill Spore for Crit buff.", RDPS="Kill Spore for Crit buff." 
          },
          t25 = { 
            GENERAL="Healers can only heal for 3 seconds every minute! DPS must kill Spores to get a massive Crit buff. Bandage yourself if low.",
            TANK="Tank center.", HEAL="Heal only every 60s (3s window).", MDPS="Kill Spore for Crit buff.", RDPS="Kill Spore for Crit buff." 
          }
        },
        { name = "Instructor Razuvious", 
          t10 = { 
            GENERAL="Boss hits too hard for normal tanks. Use the Orb to Mind Control the Understudies. Use their abilities (Bone Barrier) to tank the boss.",
            TANK="Use Crystal to MC add -> Tank boss.", HEAL="Heal MC target.", MDPS="Backstab boss.", RDPS="DPS boss. Use Crystal if assigned." 
          },
          t25 = { 
            GENERAL="Boss hits too hard for normal tanks. Priests must Mind Control the Understudies. Use their abilities (Bone Barrier) to tank the boss.",
            TANK="Priests MC Understudies. Use Bone Barrier.", HEAL="Heal MC targets.", MDPS="Backstab boss.", RDPS="DPS boss." 
          }
        },
        { name = "Gothik the Harvester", 
          t10 = { 
            GENERAL="Split raid: 'Live' side kills adds -> souls go to 'Undead' side. Undead side kills ghosts. Boss comes down at the end.",
            TANK="Split sides. Tank adds.", HEAL="Split sides.", MDPS="Kill adds fast.", RDPS="Kill adds fast." 
          },
          t25 = { 
            GENERAL="Split raid: 'Live' side kills adds -> souls go to 'Undead' side. Undead side kills ghosts. Boss comes down at the end.",
            TANK="Split sides. Tank adds.", HEAL="Split sides.", MDPS="Kill adds fast.", RDPS="Kill adds fast." 
          }
        },
        { name = "Four Horsemen", 
          t10 = { 
            GENERAL="Don't exceed 3-4 stacks of Marks. Front group handles Thane/Mograine. Back group handles Zeliek/Blaumeux. Move when marks get high.",
            TANK="Tank 2 front, 2 back. Swap at 3 stacks.", HEAL="Heal tanks.", MDPS="Focus Thane/Mograine.", RDPS="Focus Blaumeux/Zeliek." 
          },
          t25 = { 
            GENERAL="Bosses apply stacking marks. Tanks must rotate bosses every 3 marks to reset stacks. Stay in your assigned corner/zone.",
            TANK="4-Tank Rotation. Swap every 3 marks.", HEAL="Stick to corner.", MDPS="Focus front bosses.", RDPS="Focus back bosses." 
          }
        },
        { name = "Patchwerk", 
          t10 = { 
            GENERAL="Gear check. Boss hits Main Tank and the Off Tank (Hateful Strike) very hard. Healers spam heals non-stop. DPS step in slime to lower HP below OT.",
            TANK="MT Boss, OT soaks Hateful Strike.", HEAL="Spam heal tanks.", MDPS="Dip in slime for low HP.", RDPS="Nuke." 
          },
          t25 = { 
            GENERAL="Gear check. Boss hits Main Tank and 2 Off Tanks (Hateful Strike) very hard. Healers spam heals non-stop. DPS step in slime to lower HP below OTs.",
            TANK="MT Boss, 2 OTs soak Hateful Strike.", HEAL="Spam heal tanks.", MDPS="Dip in slime for low HP.", RDPS="Nuke." 
          }
        },
        { name = "Grobbulus", 
          t10 = { 
            GENERAL="Tank kites boss along the wall to drop clouds. If you get 'Mutating Injection', run behind the boss/raid to drop your cloud, then come back.",
            TANK="Kite along wall. Drop clouds behind.", HEAL="Dispel Injection away from raid.", MDPS="DPS back.", RDPS="Run out with Injection." 
          },
          t25 = { 
            GENERAL="Tank kites boss along the wall to drop clouds. If you get 'Mutating Injection', run behind the boss/raid to drop your cloud, then come back.",
            TANK="Kite along wall. Drop clouds behind.", HEAL="Dispel Injection away from raid.", MDPS="DPS back.", RDPS="Run out with Injection." 
          }
        },
        { name = "Gluth", 
          t10 = { 
            GENERAL="Kiter must keep Zombies away from boss. Every ~100s boss casts Decimate (HP to 5%) - AoE heal and kill Zombies immediately so boss doesn't eat them.",
            TANK="MT Boss, OT Zombies.", HEAL="Heal after Decimate.", MDPS="AoE Zombies at Decimate.", RDPS="Slow/AoE Zombies." 
          },
          t25 = { 
            GENERAL="Kiter must keep Zombies away from boss. Every ~100s boss casts Decimate (HP to 5%) - AoE heal and kill Zombies immediately so boss doesn't eat them.",
            TANK="MT Boss, OT Zombies.", HEAL="Heal after Decimate.", MDPS="AoE Zombies at Decimate.", RDPS="Slow/AoE Zombies." 
          }
        },
        { name = "Thaddius", 
          t10 = { 
            GENERAL="Phase 1: Kill Stalagg/Feugen together. Phase 2: Check your Polarity (+/-). Positives LEFT, Negatives RIGHT. If it changes, run through the boss.",
            TANK="Jump on Shift.", HEAL="Check Polarity (+/-).", MDPS="Check Polarity (+/-).", RDPS="Check Polarity (+/-)." 
          },
          t25 = { 
            GENERAL="Phase 1: Kill Stalagg/Feugen together. Phase 2: Check your Polarity (+/-). Positives LEFT, Negatives RIGHT. If it changes, run through the boss.",
            TANK="Jump on Shift.", HEAL="Check Polarity (+/-).", MDPS="Check Polarity (+/-).", RDPS="Check Polarity (+/-)." 
          }
        },
        { name = "Sapphiron", 
          t10 = { 
            GENERAL="Constant Frost damage. Avoid Blizzards. When boss flies up, hide behind an Ice Block player to avoid the massive frost breath bomb.",
            TANK="Hide in air phase.", HEAL="Heal Frost Aura.", MDPS="Hide in air phase.", RDPS="Hide in air phase." 
          },
          t25 = { 
            GENERAL="Constant Frost damage. Avoid Blizzards. When boss flies up, hide behind an Ice Block player to avoid the massive frost breath bomb.",
            TANK="Hide in air phase.", HEAL="Heal Frost Aura.", MDPS="Hide in air phase.", RDPS="Hide in air phase." 
          }
        },
        { name = "Kel'Thuzad", 
          t10 = { 
            GENERAL="P1: Kill adds, don't let them reach circle. P2: Spread out >10 yards! Interrupt Frostbolts. P3: Guardians spawn, burn boss.",
            TANK="P1 Adds, P2 Kick Frostbolt.", HEAL="Spread out!", MDPS="Kick Frostbolt.", RDPS="Spread out >10y!" 
          },
          t25 = { 
            GENERAL="P1: Kill adds, don't let them reach circle. P2: Spread out >10 yards! Interrupt Frostbolts. P3: Guardians spawn, burn boss.",
            TANK="P1 Adds, P2 Kick Frostbolt.", HEAL="Spread out!", MDPS="Kick Frostbolt.", RDPS="Spread out >10y!" 
          }
        }
    },

    -- === HEROIC DUNGEONS ===
    dungeons = {
        { name = "Utgarde Keep", bosses = {
            { name = "Prince Keleseth", 
              GENERAL="He casts Ice Tomb on a player. DPS must switch and break the tomb instantly, or the player takes massive damage.",
              TANK="Keep aggro. Break Ice Tombs ASAP.", 
              HEAL="Heal Tomb target. Dispel frost.", 
              MDPS="Switch to Ice Tomb instantly!", 
              RDPS="Switch to Ice Tomb instantly!" },
            { name = "Skarvald & Dalronn", 
              GENERAL="You must kill both bosses roughly at the same time. If one dies, he becomes a ghost and continues to attack.",
              TANK="Tank both. They revive as ghosts.", 
              HEAL="Heal random target charges.", 
              MDPS="Kill them roughly at same time.", 
              RDPS="Kill them roughly at same time." },
            { name = "Ingvar the Plunderer", 
              GENERAL="Avoid his frontal Smash (cast time). In P2 he revives and does massive Shadow damage. Hide behind pillars to LoS the Smash if needed.",
              TANK="Turn boss away. LoS Smash behind pillar.", 
              HEAL="Heal tank heavy dmg in P2.", 
              MDPS="Avoid Smash/Cleave. Run behind pillar on cast.", 
              RDPS="LoS Smash behind pillar." }
        }},
        { name = "Utgarde Pinnacle", bosses = {
            { name = "Svala Sorrowgrave", 
              GENERAL="She targets a player for Ritual. Three adds spawn channeling on them. Kill the channeler add ASAP to save the player.",
              TANK="Tank boss.", 
              HEAL="Heal the ritual target heavily.", 
              MDPS="Kill the ritual add to free player.", 
              RDPS="Kill the ritual add to free player." },
            { name = "Gortok Palehoof", 
              GENERAL="Activate the orbs to fight minibosses first. Gortok does Withering Roar (HP reduction), heal through it.",
              TANK="Pick up boss after adds.", 
              HEAL="Heal Withering Roar dmg.", 
              MDPS="Kill adds first.", 
              RDPS="Kill adds first." },
            { name = "Skadi the Ruthless", 
              GENERAL="Gauntlet event. Kill Grauf (dragon) using Harpoons dropped by Lancers. Once dragon dies, tank and spank the boss.",
              TANK="Kite through gauntlet.", 
              HEAL="Heal heavy movement dmg.", 
              MDPS="Loot Harpoons. Kill Mage/Lancer first.", 
              RDPS="Loot Harpoons. Shoot Drake when in range." },
            { name = "King Ymiron", 
              GENERAL="Boss casts Bane (Dark purple aura). Everyone must STOP attacking and run away, or you take massive damage.",
              TANK="Run out of Dark Bane (Purple Aura).", 
              HEAL="Dispel Fear. Run from Bane.", 
              MDPS="Run out of Dark Bane! Don't hit.", 
              RDPS="Run out of Dark Bane! Don't hit." }
        }},
        { name = "The Nexus", bosses = {
            { name = "Grand Magus Telestra", 
              GENERAL="At 50% she splits into 3 (Fire, Frost, Arcane). Stop DPS on split. Kill Fire (AoE) -> Arcane (Poly) -> Frost (Blizzard).",
              TANK="Tank boss. Pick up Melee copy in P2.", 
              HEAL="Dispel magic. Heal Gravity/Fire dmg.", 
              MDPS="Stop DPS on Split. Focus Fire > Arcane > Frost.", 
              RDPS="Stop DPS on Split. Focus Fire > Arcane > Frost." },
            { name = "Anomalus", 
              GENERAL="Boss spawns Chaotic Rifts. Boss becomes immune. You MUST kill the Rifts to damage the boss again.",
              TANK="Tank boss.", 
              HEAL="Heal Rift dmg.", 
              MDPS="Kill Chaotic Rifts! Boss is immune.", 
              RDPS="Kill Chaotic Rifts! Boss is immune." },
            { name = "Ormorok the Tree-Shaper", 
              GENERAL="Avoid Crystal Spikes on the ground. When he casts Spell Reflection, stop casting magic on him.",
              TANK="Don't spin boss. Avoid Spikes.", 
              HEAL="Heal reflect dmg.", 
              MDPS="Watch for Spell Reflection. Avoid Spikes.", 
              RDPS="Watch for Spell Reflection. Avoid Spikes." },
            { name = "Keristrasza", 
              GENERAL="Applys Intense Cold debuff (slow + dmg). JUMP continuously or move to clear the stacks. Don't let it stack high.",
              TANK="Jump to clear Intense Cold debuff.", 
              HEAL="Jump to clear Intense Cold debuff.", 
              MDPS="Jump to clear Intense Cold debuff.", 
              RDPS="Jump to clear Intense Cold debuff." }
        }},
        { name = "Azjol-Nerub", bosses = {
            { name = "Krik'thir the Gatewatcher", 
              GENERAL="Waves of adds first. During boss, watch out for Skirmishers (adds) that fixate on players. AoE them down.",
              TANK="Tank boss. Pick up Skirmishers.", 
              HEAL="Heal raid dmg from Skirmishers.", 
              MDPS="AoE adds. Focus Skirmishers.", 
              RDPS="AoE adds. Focus Skirmishers." },
            { name = "Hadronox", 
              GENERAL="Clear the room first. Block the tunnels with webs to stop add spawns. Don't dispel the Acid Cloud (it heals the boss).",
              TANK="Block tunnels with webs. Tank boss.", 
              HEAL="Dispel Leech Poison. Don't dispel Acid clouds.", 
              MDPS="Stay away from poison clouds.", 
              RDPS="Stay away from poison clouds." },
            { name = "Anub'arak", 
              GENERAL="Boss burrows and spawns spikes. Run away from spikes (don't stand on dust clouds). Kill Guardian adds.",
              TANK="Tank Guardian adds. Boss takes extra dmg.", 
              HEAL="Kite Spikes on ground.", 
              MDPS="Kill adds. Nuke boss.", 
              RDPS="Kill adds. Nuke boss. Run from Spikes." }
        }},
        { name = "Ahn'kahet", bosses = {
            { name = "Elder Nadox", 
              GENERAL="Boss spawns an Ahn'kahar Guardian that makes him immune. Kill the Guardian add immediately to drop the shield.",
              TANK="Boss immune during shield.", 
              HEAL="Heal poison.", 
              MDPS="Kill Ahn'kahar Guardian to remove shield.", 
              RDPS="Kill Ahn'kahar Guardian to remove shield." },
            { name = "Prince Taldaram", 
              GENERAL="Boss casts Embrace of the Vampyr (stuns and drains life). Heal the target heavily. DPS can keep nuking.",
              TANK="Tank boss.", 
              HEAL="Heal Embrace of Vampyr target.", 
              MDPS="Nuke boss. Be careful with aggro.", 
              RDPS="Nuke boss." },
            { name = "Jedoga Shadowseeker", 
              GENERAL="She flies up and calls a Volunteer add. KILL the add before it reaches the circle, or the boss gets a massive damage buff.",
              TANK="Tank boss.", 
              HEAL="Heal Cyclone dmg.", 
              MDPS="Kill 'Volunteer' add before it reaches boss!", 
              RDPS="Kill 'Volunteer' add before it reaches boss!" },
            { name = "Herald Volazj", 
              GENERAL="At 66% and 33%, boss casts Insanity. Everyone sees clones of their party. Kill your own clones first, then help others.",
              TANK="Kill your clone.", 
              HEAL="Kill your clone. Heal after phase.", 
              MDPS="Kill your clone, then help others.", 
              RDPS="Kill your clone, then help others." }
        }},
        { name = "Drak'Tharon Keep", bosses = {
            { name = "Trollgore", 
              GENERAL="Boss consumes corpses to buff himself. Adds spawn regularly - AoE them down fast so he can't eat them.",
              TANK="Pick up adds.", 
              HEAL="Heal Corpse Explode dmg.", 
              MDPS="Avoid Corpse Explode.", 
              RDPS="Avoid Corpse Explode." },
            { name = "Novos the Summoner", 
              GENERAL="Boss is shielded. Kill 4 Summoners/Handlers (adds) coming down the stairs to remove his shield. Stay out of Blizzard.",
              TANK="Pick up adds on stairs.", 
              HEAL="Stay out of Blizzard.", 
              MDPS="Kill Handlers to drop shield.", 
              RDPS="Kill Handlers to drop shield." },
            { name = "King Dred", 
              GENERAL="Big dinosaur. He fears often. Tank needs to use cooldowns or Beserker Rage. Healers dispel fear quickly.",
              TANK="Use CDs on Fears/Bellows.", 
              HEAL="Dispel Fear if possible.", 
              MDPS="Nuke. Don't pull aggro.", 
              RDPS="Nuke." },
            { name = "The Prophet Tharon'ja", 
              GENERAL="Boss turns everyone into Skeletons. Use the new abilities! Tank uses Bone Armor/Taunt. Healers use Drain Life. DPS use attacks.",
              TANK="Skeleton Phase: Use Taunt/Bone Armor.", 
              HEAL="Skeleton Phase: Use Drain Life to heal.", 
              MDPS="Skeleton Phase: Use DPS skills. Don't stand in fire.", 
              RDPS="Skeleton Phase: Use DPS skills. Don't stand in fire." }
        }},
        { name = "Gundrak", bosses = {
            { name = "Slad'ran", 
              GENERAL="Spawns snakes. Tank picks them up, DPS AoE them. Don't get surrounded or you get wrapped.",
              TANK="Pick up snakes.", 
              HEAL="Heal poison nova.", 
              MDPS="AoE Snakes. Don't get surrounded.", 
              RDPS="AoE Snakes." },
            { name = "Drakkari Colossus", 
              GENERAL="Phase 1: Colossus. Phase 2: Elemental emerges. Don't stand in purple Mojo puddles on the floor.",
              TANK="P2: Tank Elemental.", 
              HEAL="Heal Mojo puddle dmg.", 
              MDPS="Don't stand in purple Mojo.", 
              RDPS="Don't stand in purple Mojo." },
            { name = "Moorabi", 
              GENERAL="He tries to transform into a mammoth. INTERRUPT 'Transformation' cast at all costs! If he transforms, he hits very hard.",
              TANK="Tank boss.", 
              HEAL="Heal Quake.", 
              MDPS="Interrupt Transformation! Priority #1.", 
              RDPS="Interrupt Transformation! Priority #1." },
            { name = "Gal'darah", 
              GENERAL="Boss does a Whirlwind (run away). He impales a random player - heal them.",
              TANK="Tank boss.", 
              HEAL="Heal Whirlwind dmg.", 
              MDPS="Run out during Whirlwind.", 
              RDPS="Keep distance." }
        }},
        { name = "Halls of Stone", bosses = {
            { name = "Krystallus", 
              GENERAL="Boss casts Shatter. Everyone gets turned to stone. Before this happens, SPREAD OUT so you don't damage neighbors.",
              TANK="Tank boss.", 
              HEAL="Heal Shatter (Raid wide dmg).", 
              MDPS="Spread out for Shatter (Turn to stone).", 
              RDPS="Spread out for Shatter (Turn to stone)." },
            { name = "Maiden of Grief", 
              GENERAL="Places Void Zones (black puddles) - move out. Casts Shock of Sorrow (incapacitate) - take damage from puddle to break it.",
              TANK="Move out of Void Zones (Storm).", 
              HEAL="Heal Shock dmg.", 
              MDPS="Move out of Void Zones.", 
              RDPS="Move out of Void Zones." },
            { name = "Tribunal of Ages", 
              GENERAL="Event. Protect Brann Bronzebeard. Kill adds spawning from the faces. Don't let Brann die.",
              TANK="Pick up adds at stairs.", 
              HEAL="Heal party.", 
              MDPS="Protect Brann. Kill adds.", 
              RDPS="Protect Brann. Kill adds." },
            { name = "Sjonnir The Ironshaper", 
              GENERAL="Tank boss. Dispel Static Charge. If you have the charge, move away from allies. Kill Ooze/Dwarf adds.",
              TANK="Tank boss and adds.", 
              HEAL="Dispel Static Charge.", 
              MDPS="Move away if you have Static Charge.", 
              RDPS="Move away if you have Static Charge. Kill Oozes." }
        }},
        { name = "Halls of Lightning", bosses = {
            { name = "General Bjarngrim", 
              GENERAL="Boss charges up with electricity (Temporary Electrical Charge). Don't attack while he glows blue/charged or you die.",
              TANK="Tank boss. Watch for electrical charge.", 
              HEAL="Heal stance dmg.", 
              MDPS="Don't switch stance buff.", 
              RDPS="Don't switch stance buff." },
            { name = "Volkhan", 
              GENERAL="Spawns Golems. When they die, they shatter. Don't kill them in melee range of the group.",
              TANK="Kite Golems.", 
              HEAL="Heal Shatter dmg.", 
              MDPS="Don't kill Golems in melee range (Shatter).", 
              RDPS="Kill Golems when they are frozen." },
            { name = "Ionar", 
              GENERAL="Boss turns into Ball Lightning and chases players. Run away! Spread out to avoid Static Overload chain lightning.",
              TANK="Tank boss.", 
              HEAL="Spread out (Static Overload).", 
              MDPS="Run out when he turns into Ball Lightning.", 
              RDPS="Run out when he turns into Ball Lightning. Spread." },
            { name = "Loken", 
              GENERAL="Boss casts Lightning Nova (huge AoE). Run FAR away (20y+) to avoid damage. Stay stacked otherwise.",
              TANK="Tank in place.", 
              HEAL="Heavy AoE heal (Lightning Nova).", 
              MDPS="Run OUT for Lightning Nova. Stay IN otherwise.", 
              RDPS="Run OUT for Lightning Nova. Stay IN otherwise." }
        }},
        { name = "The Oculus", bosses = {
            { name = "Drakos", 
              GENERAL="Basic dragon fight. Don't stand in bombs. He pulls everyone to him - run away.",
              TANK="Tank boss.", 
              HEAL="Heal AoE.", 
              MDPS="Don't stand in bombs.", 
              RDPS="Don't stand in bombs." },
            { name = "Varos", 
              GENERAL="Boss summons beams from pillars. Don't cross the beams. Follow the safe spot around the platform.",
              TANK="Tank boss.", 
              HEAL="Heal beam dmg.", 
              MDPS="Avoid beams. Follow safe spot.", 
              RDPS="Avoid beams. Follow safe spot." },
            { name = "Mage-Lord Urom", 
              GENERAL="He teleports around. Casts Arcane Explosion - Line of Sight (LoS) it by hiding behind the central pillar.",
              TANK="Tank boss.", 
              HEAL="LoS Arcane Explosion.", 
              MDPS="LoS Arcane Explosion behind pillar.", 
              RDPS="LoS Arcane Explosion behind pillar." },
            { name = "Eregos", 
              GENERAL="Vehicle fight! Ruby (Tank): Use Evasion/Searing Wrath. Emerald (Heal): Stack Leech on boss. Amber (DPS): Time Stop boss on Enrage.",
              TANK="Ruby Drake: Use Searing Wrath to tank.", 
              HEAL="Emerald Drake: Leech Life to heal.", 
              MDPS="Amber Drake: Use Time Stop on Enrage.", 
              RDPS="Amber Drake: Use Time Stop on Enrage." }
        }},
        { name = "Culling of Stratholme", bosses = {
            { name = "Meathook", 
              GENERAL="Abomination boss. Watch out for chains (stun). DPS burn him down.",
              TANK="Avoid chains.", 
              HEAL="Heal Spit.", 
              MDPS="Nuke.", 
              RDPS="Nuke." },
            { name = "Salramm the Fleshcrafter", 
              GENERAL="Necromancer. Summons ghouls. Dispels Curse. Just kill adds and boss.",
              TANK="Tank boss.", 
              HEAL="Dispel Curse.", 
              MDPS="Kill Ghouls.", 
              RDPS="Kill Ghouls." },
            { name = "Chrono-Lord Epoch", 
              GENERAL="Casts Curse of Exertion (spells cost HP/Mana) and Time Stop (stuns area). Move out of the sand traps.",
              TANK="Tank boss.", 
              HEAL="Heal Curse of Exertion target.", 
              MDPS="Move out of Time Stop.", 
              RDPS="Move out of Time Stop." },
            { name = "Mal'Ganis", 
              GENERAL="Dreadlord. Puts players to Sleep (invulnerable but stunned). Tank and spank.",
              TANK="Tank boss.", 
              HEAL="Heal Sleep target.", 
              MDPS="Nuke.", 
              RDPS="Nuke." }
        }},
        { name = "Violet Hold", bosses = {
            { name = "Portal Bosses", 
              GENERAL="Random bosses spawn from portals. Kill them before the door breaks. Use defense crystals if overwhelmed.",
              TANK="Pick up boss quickly.", 
              HEAL="Watch mechanics.", 
              MDPS="Nuke.", 
              RDPS="Nuke." },
            { name = "Cyanigosa", 
              GENERAL="Dragon boss. Casts Blizzard (move out) and pulls everyone to her (Arcane Vacuum). Run back.",
              TANK="Tank boss. Move out of Blizzard.", 
              HEAL="Heal Blizzard dmg.", 
              MDPS="Move out of Blizzard.", 
              RDPS="Move out of Blizzard." }
        }}
    }
}

-- STATE
local currentType = "naxx" 
local currentSize = "25"   
local currentDungeonIndex = 1
local currentBossIndex = 1
local myRole = "MDPS"
local selectedPlayer = nil

-- =========================================================================
-- 2. HELPER FUNCTIONS
-- =========================================================================

local function DetectRole()
    local _, class = UnitClass("player")
    local role = "MDPS" 

    local activeTab = GetActiveTalentGroup() 
    local tab1 = select(3, GetTalentTabInfo(1))
    local tab2 = select(3, GetTalentTabInfo(2))
    local tab3 = select(3, GetTalentTabInfo(3))
    
    local maxPoints = 0
    local mainTree = 1
    if tab1 > maxPoints then maxPoints = tab1; mainTree = 1 end
    if tab2 > maxPoints then maxPoints = tab2; mainTree = 2 end
    if tab3 > maxPoints then maxPoints = tab3; mainTree = 3 end

    if class == "WARRIOR" then
        if mainTree == 3 then role = "TANK" else role = "MDPS" end
    elseif class == "PALADIN" then
        if mainTree == 1 then role = "HEAL" 
        elseif mainTree == 2 then role = "TANK" 
        else role = "MDPS" end
    elseif class == "HUNTER" then role = "RDPS"
    elseif class == "ROGUE" then role = "MDPS"
    elseif class == "PRIEST" then
        if mainTree == 3 then role = "RDPS" else role = "HEAL" end
    elseif class == "DEATHKNIGHT" then
        local def = GetCombatRating(CR_DEFENSE_SKILL)
        if def > 100 then role = "TANK" else role = "MDPS" end 
    elseif class == "SHAMAN" then
        if mainTree == 1 then role = "RDPS" 
        elseif mainTree == 2 then role = "MDPS" 
        else role = "HEAL" end
    elseif class == "MAGE" then role = "RDPS"
    elseif class == "WARLOCK" then role = "RDPS"
    elseif class == "DRUID" then
        if mainTree == 1 then role = "RDPS" 
        elseif mainTree == 3 then role = "HEAL" 
        else 
            local def = GetCombatRating(CR_DEFENSE_SKILL)
            if def > 100 then role = "TANK" else role = "MDPS" end
        end
    end
    return role
end

local function GetRoleIcon(role)
    if role == "TANK" then return "|cffeda55f[TANK]|r" end
    if role == "HEAL" then return "|cff00ff00[HEAL]|r" end
    if role == "MDPS" then return "|cffc41f3b[MELEE]|r" end
    if role == "RDPS" then return "|cff3fc7eb[RANGED]|r" end
    return role
end

-- OPRAVA: Safe insert pre WoW 3.3.5
local function GetGroupMembers()
    local members = {}
    local num = GetNumRaidMembers()
    if num > 0 then
        for i=1, num do
            local name = GetRaidRosterInfo(i)
            if name then members[#members+1] = name end
        end
    else
        num = GetNumPartyMembers()
        if num > 0 then
            for i=1, num do
                local name = UnitName("party"..i)
                if name then members[#members+1] = name end
            end
            members[#members+1] = UnitName("player")
        end
    end
    table.sort(members)
    return members
end

-- =========================================================================
-- 3. UI CREATION
-- =========================================================================

function SS:Toggle()
    if not self.uiCreated then
        self:CreateUI()
        self.uiCreated = true
    end
    if self:IsShown() then
        self:Hide()
    else
        self:Show()
        self:UpdateDisplay()
    end
end

function SS:CreateUI()
    self:SetSize(600, 650) 
    self:SetPoint("CENTER")
    self:SetFrameStrata("MEDIUM")
    self:EnableMouse(true)
    self:SetMovable(true)
    self:RegisterForDrag("LeftButton")
    self:SetScript("OnDragStart", self.StartMoving)
    self:SetScript("OnDragStop", self.StopMovingOrSizing)
    
    self:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 11, right = 12, top = 12, bottom = 11 }
    })

    local header = self:CreateTexture(nil, "ARTWORK")
    header:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    header:SetWidth(350)
    header:SetHeight(64)
    header:SetPoint("TOP", 0, 12)
    
    local title = self:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", header, "TOP", 0, -14)
    title:SetText("Sausage Strats v5.1")

    local closeBtn = CreateFrame("Button", nil, self, "UIPanelCloseButton")
    closeBtn:SetPoint("TOPRIGHT", -5, -5)

    -- === DROPDOWNS === --

    local typeLabel = self:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    typeLabel:SetPoint("TOPLEFT", 25, -35)
    typeLabel:SetText("Content:")

    local typeDrop = CreateFrame("Frame", "SS_TypeDrop", self, "UIDropDownMenuTemplate")
    typeDrop:SetPoint("TOPLEFT", 10, -50)
    UIDropDownMenu_SetWidth(typeDrop, 120)
    UIDropDownMenu_SetText(typeDrop, "Naxxramas")

    local subLabel = self:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subLabel:SetPoint("TOPLEFT", 175, -35)
    subLabel:SetText("Raid Size:")
    self.subLabel = subLabel 

    local subDrop = CreateFrame("Frame", "SS_SubDrop", self, "UIDropDownMenuTemplate")
    subDrop:SetPoint("TOPLEFT", 160, -50)
    UIDropDownMenu_SetWidth(subDrop, 140)
    UIDropDownMenu_SetText(subDrop, "25 Man")
    self.subDrop = subDrop 

    local bossLabel = self:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    bossLabel:SetPoint("TOPLEFT", 335, -35)
    bossLabel:SetText("Boss:")

    local bossDrop = CreateFrame("Frame", "SS_BossDrop", self, "UIDropDownMenuTemplate")
    bossDrop:SetPoint("TOPLEFT", 320, -50)
    UIDropDownMenu_SetWidth(bossDrop, 150)
    UIDropDownMenu_SetText(bossDrop, DB.naxx[1].name)
    self.bossDrop = bossDrop 

    -- INIT FUNCTIONS (FIXED)
    
    local function InitBossDrop(self, level)
        local list
        if currentType == "naxx" then
            list = DB.naxx
        else
            list = DB.dungeons[currentDungeonIndex].bosses
        end

        for i, data in ipairs(list) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = data.name
            info.func = function()
                currentBossIndex = i
                UIDropDownMenu_SetText(SS.bossDrop, data.name)
                SS:UpdateDisplay()
            end
            UIDropDownMenu_AddButton(info)
        end
    end

    local function InitSubDrop(self, level)
        if currentType == "naxx" then
            local info = UIDropDownMenu_CreateInfo()
            info.text = "10 Man"
            info.func = function() currentSize = "10"; UIDropDownMenu_SetText(SS.subDrop, "10 Man"); SS:UpdateDisplay() end
            UIDropDownMenu_AddButton(info)
            
            info = UIDropDownMenu_CreateInfo()
            info.text = "25 Man"
            info.func = function() currentSize = "25"; UIDropDownMenu_SetText(SS.subDrop, "25 Man"); SS:UpdateDisplay() end
            UIDropDownMenu_AddButton(info)
        else
            for i, dung in ipairs(DB.dungeons) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = dung.name
                info.func = function() 
                    currentDungeonIndex = i
                    currentBossIndex = 1
                    UIDropDownMenu_SetText(SS.subDrop, dung.name)
                    UIDropDownMenu_SetText(SS.bossDrop, dung.bosses[1].name)
                    SS:UpdateDisplay()
                end
                UIDropDownMenu_AddButton(info)
            end
        end
    end

    local function InitTypeDrop(self, level)
        local info = UIDropDownMenu_CreateInfo()
        info.text = "Naxxramas"
        info.func = function() 
            currentType = "naxx"
            currentBossIndex = 1
            SS.subLabel:SetText("Raid Size:") 
            UIDropDownMenu_SetText(typeDrop, "Naxxramas")
            UIDropDownMenu_SetText(SS.subDrop, "25 Man")
            UIDropDownMenu_SetText(SS.bossDrop, DB.naxx[1].name)
            SS:UpdateDisplay()
        end
        UIDropDownMenu_AddButton(info)

        info = UIDropDownMenu_CreateInfo()
        info.text = "Heroic Dungeons"
        info.func = function() 
            currentType = "dungeons"
            currentDungeonIndex = 1
            currentBossIndex = 1
            SS.subLabel:SetText("Instance:")
            UIDropDownMenu_SetText(typeDrop, "Heroic Dungeons")
            UIDropDownMenu_SetText(SS.subDrop, DB.dungeons[1].name)
            UIDropDownMenu_SetText(SS.bossDrop, DB.dungeons[1].bosses[1].name)
            SS:UpdateDisplay()
        end
        UIDropDownMenu_AddButton(info)
    end

    UIDropDownMenu_Initialize(typeDrop, InitTypeDrop)
    UIDropDownMenu_Initialize(subDrop, InitSubDrop)
    UIDropDownMenu_Initialize(bossDrop, InitBossDrop)

    -- === CONTENT AREAS === --

    -- 1. MY ROLE
    local myRoleFrame = CreateFrame("Frame", nil, self)
    myRoleFrame:SetPoint("TOPLEFT", 25, -90)
    myRoleFrame:SetPoint("RIGHT", -25, 0)
    myRoleFrame:SetHeight(120) 
    
    myRoleFrame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    myRoleFrame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    myRoleFrame:SetBackdropBorderColor(1, 0.8, 0, 1)

    self.myRoleHeader = myRoleFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    self.myRoleHeader:SetPoint("TOPLEFT", 10, -10)
    self.myRoleHeader:SetText("YOUR JOB:")

    self.myRoleText = myRoleFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    self.myRoleText:SetPoint("TOPLEFT", 10, -35)
    self.myRoleText:SetPoint("BOTTOMRIGHT", -10, 10) 
    self.myRoleText:SetJustifyH("LEFT")
    self.myRoleText:SetJustifyV("TOP")
    self.myRoleText:SetWordWrap(true)
    self.myRoleText:SetText("...")

    -- 2. OTHERS
    local otherFrame = CreateFrame("Frame", nil, self)
    otherFrame:SetPoint("TOPLEFT", myRoleFrame, "BOTTOMLEFT", 0, -15)
    otherFrame:SetPoint("RIGHT", -25, 0)
    otherFrame:SetHeight(160) -- Slightly smaller to make room for general

    self.otherText = otherFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    self.otherText:SetPoint("TOPLEFT", 0, 0)
    self.otherText:SetPoint("BOTTOMRIGHT", 0, 0)
    self.otherText:SetJustifyH("LEFT")
    self.otherText:SetJustifyV("TOP")
    self.otherText:SetWordWrap(true)
    self.otherText:SetSpacing(6)

    -- 3. GENERAL TACTICS (NEW BLUE BOX)
    local genFrame = CreateFrame("Frame", nil, self)
    genFrame:SetPoint("TOPLEFT", otherFrame, "BOTTOMLEFT", 0, -15)
    genFrame:SetPoint("RIGHT", -25, 0)
    genFrame:SetHeight(120) 
    
    genFrame:SetBackdrop({
        bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    genFrame:SetBackdropColor(0.1, 0.1, 0.1, 0.8)
    genFrame:SetBackdropBorderColor(0, 0.7, 1, 1) -- BLUE BORDER

    local genHeader = genFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    genHeader:SetPoint("TOPLEFT", 10, -10)
    genHeader:SetText("|cff00bfffGENERAL TACTICS:|r")

    self.genText = genFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    self.genText:SetPoint("TOPLEFT", 10, -30)
    self.genText:SetPoint("BOTTOMRIGHT", -10, 10)
    self.genText:SetJustifyH("LEFT")
    self.genText:SetJustifyV("TOP")
    self.genText:SetWordWrap(true)
    self.genText:SetText("...")

    -- === BOTTOM BUTTONS === --

    local shareBtn = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
    shareBtn:SetSize(120, 30)
    shareBtn:SetPoint("BOTTOMLEFT", 25, 15)
    shareBtn:SetText("Share to Raid")
    shareBtn:SetScript("OnClick", function() SS:ShareStrats("RAID") end)

    local whisperBtn = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
    whisperBtn:SetSize(120, 30)
    whisperBtn:SetPoint("BOTTOMRIGHT", -25, 15)
    whisperBtn:SetText("Whisper Player")
    whisperBtn:SetScript("OnClick", function() 
        if selectedPlayer then
            SS:ShareStrats("WHISPER", selectedPlayer)
        else
            print("|cffff0000SausageStrats:|r Select a player first!")
        end
    end)

    local playerDrop = CreateFrame("Frame", "SS_PlayerDrop", self, "UIDropDownMenuTemplate")
    playerDrop:SetPoint("RIGHT", whisperBtn, "LEFT", 10, -2)
    UIDropDownMenu_SetWidth(playerDrop, 100)
    UIDropDownMenu_SetText(playerDrop, "Select Player")

    local function InitPlayerDrop(self, level)
        local players = GetGroupMembers()
        for _, p in ipairs(players) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = p
            info.func = function()
                selectedPlayer = p
                UIDropDownMenu_SetText(playerDrop, p)
            end
            UIDropDownMenu_AddButton(info)
        end
    end
    UIDropDownMenu_Initialize(playerDrop, InitPlayerDrop)

    self:UpdateDisplay()
end

function SS:UpdateDisplay()
    if not self.myRoleText then return end
    
    local list = (currentType == "naxx") and DB.naxx or DB.dungeons
    
    local stratData
    if currentType == "naxx" then
        stratData = list[currentBossIndex]
    else
        stratData = list[currentDungeonIndex].bosses[currentBossIndex]
    end
    
    local strats
    if currentType == "naxx" then
        strats = (currentSize == "10") and stratData.t10 or stratData.t25
    else
        strats = stratData
    end

    myRole = DetectRole()

    -- 1. My Role
    self.myRoleHeader:SetText(GetRoleIcon(myRole))
    self.myRoleText:SetText(strats[myRole] or "No specific strategy.")

    -- 2. Others
    local otherStr = ""
    local roles = {"TANK", "HEAL", "MDPS", "RDPS"}
    for _, r in ipairs(roles) do
        if r ~= myRole then
            otherStr = otherStr .. GetRoleIcon(r) .. ": |cffffffff" .. (strats[r] or "...") .. "|r\n"
        end
    end
    self.otherText:SetText(otherStr)

    -- 3. General (New)
    self.genText:SetText(strats.GENERAL or "No general tactics available.")
end

function SS:ShareStrats(channel, target)
    local list = (currentType == "naxx") and DB.naxx or DB.dungeons
    local stratData
    local strats
    local title
    
    if currentType == "naxx" then
        stratData = list[currentBossIndex]
        strats = (currentSize == "10") and stratData.t10 or stratData.t25
        title = stratData.name .. " (" .. currentSize .. "m)"
    else
        local dungeon = list[currentDungeonIndex]
        stratData = dungeon.bosses[currentBossIndex]
        strats = stratData
        title = stratData.name .. " (" .. dungeon.name .. ")"
    end

    if channel == "RAID" then
        if GetNumRaidMembers() == 0 then channel = "PARTY" end
        if GetNumPartyMembers() == 0 then channel = "SAY" end
    end

    SendChatMessage("--- " .. title .. " (SausageStrats) ---", channel, nil, target)
    SendChatMessage("TACTICS: " .. (strats.GENERAL or ""), channel, nil, target)
    SendChatMessage("[TANK]: " .. strats.TANK, channel, nil, target)
    SendChatMessage("[HEAL]: " .. strats.HEAL, channel, nil, target)
    SendChatMessage("[DPS]: " .. strats.MDPS, channel, nil, target)
end

-- =========================================================================
-- 4. MINIMAP BUTTON
-- =========================================================================

function SS:CreateMinimapButton()
    local mmBtn = CreateFrame("Button", "SausageStratsMinimapBtn", Minimap)
    mmBtn:SetFrameStrata("MEDIUM")
    mmBtn:SetSize(31, 31)
    mmBtn:SetFrameLevel(8)
    mmBtn:RegisterForClicks("AnyUp")
    mmBtn:RegisterForDrag("LeftButton")
    mmBtn:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")

    local overlay = mmBtn:CreateTexture(nil, "OVERLAY")
    overlay:SetSize(53, 53)
    overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    overlay:SetPoint("TOPLEFT")

    local icon = mmBtn:CreateTexture(nil, "BACKGROUND")
    icon:SetSize(20, 20)
    icon:SetTexture("Interface\\Icons\\Inv_Misc_Food_54") 
    icon:SetPoint("CENTER", 0, 1)

    local function UpdatePosition()
        local angle = SausageStratsDB.minimapPos or 45
        local x = math.cos(math.rad(angle)) * 80
        local y = math.sin(math.rad(angle)) * 80
        mmBtn:SetPoint("CENTER", Minimap, "CENTER", x, y)
    end

    mmBtn:SetScript("OnDragStart", function(self)
        self:LockHighlight()
        self.isMoving = true
        self:SetScript("OnUpdate", function(self)
            local mx, my = Minimap:GetCenter()
            local cx, cy = GetCursorPosition()
            local scale = Minimap:GetEffectiveScale()
            cx, cy = cx / scale, cy / scale
            local angle = math.deg(math.atan2(cy - my, cx - mx))
            SausageStratsDB.minimapPos = angle
            UpdatePosition()
        end)
    end)

    mmBtn:SetScript("OnDragStop", function(self)
        self:UnlockHighlight()
        self.isMoving = false
        self:SetScript("OnUpdate", nil)
    end)

    mmBtn:SetScript("OnClick", function(self, button)
        SS:Toggle()
    end)

    mmBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:SetText("Sausage Strats")
        GameTooltip:AddLine("Left Click: Toggle Window", 1, 1, 1)
        GameTooltip:AddLine("Right Click: Drag to move", 1, 1, 1)
        GameTooltip:Show()
    end)
    mmBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    UpdatePosition()
end

-- =========================================================================
-- 5. STARTUP
-- =========================================================================

SLASH_SAUSAGESTRATS1 = "/ss"
SLASH_SAUSAGESTRATS2 = "/strats"
SlashCmdList["SAUSAGESTRATS"] = function(msg)
    SS:Toggle()
end

SS:RegisterEvent("ADDON_LOADED")
SS:RegisterEvent("PLAYER_TALENT_UPDATE") 
SS:SetScript("OnEvent", function(self, event, name)
    if event == "ADDON_LOADED" and name == addonName then
        self:UnregisterEvent("ADDON_LOADED")
        SausageStratsDB.minimapPos = SausageStratsDB.minimapPos or 45
        self:CreateMinimapButton()
        print("|cffcd853fSausageStrats v5.1|r loaded! Click the sausage icon.")
    elseif event == "PLAYER_TALENT_UPDATE" then
        self:UpdateDisplay()
    end
end)