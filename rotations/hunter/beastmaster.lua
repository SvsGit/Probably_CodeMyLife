ProbablyEngine.rotation.register_custom(253, "CodeMyLife BeastMaster", {  
--------------------------------------------------Defensive-------------------------------------------- 
    {"TaMere","@CML.PQIConfing()"},
    {"TaMere","@CML.Status()"},
    {"pause","@CML.CombatCheck()"}, -- Combat Check/Pause
    {"pause","player.buff(5384)"}, -- Pause for Feign Death 
    {"PetManager","@CML.PetManager()"},
    {"Cooldowns","@CML.Cooldowns()"},
    {"SuperPsyStuff", "@CML.SuperDuperMacroBeast()"},
    {"pause","@CML.SuperDuperMacroTimer()"},

    -- Aspect of the Iron Hawk
    {"109260",{ 
        "player.spell(109260).exists",
        "player.stance != 1",
    }},
    -- Aspect of the Hawk
    {"13165",{
        "ActiveAspects.pqicheck",
        "player.spell(13165).exists",
        "player.stance != 1",
    }},   
    -- Exhilaration
     {"109304",{
        "player.spell(109304).exists",
        "Exhilaration.novaHealing(0)",
    }},      
    -- Healthstone
    {"#5512",{
        "@CML.HealthStone()",
    },}, 
    -- Deterrence
     {"19263",{
        "Deterrence.novaHealing(0)",
    }},   
    -- Feign Death
    {"5384",{
        "FeignDeath.novaHealing(0)",
    }}, 
    -- Hearth of the Phoenix               
    {"55709",{
        "pet.spell(55709).exists",
        "!pet.alive",
    }},
--[[    -- Revive Pet            
    {"982",{
        "!player.moving",
        "pet.spell(55709).cooldown > 2",
        "!pet.alive",
    }},   ]] 
    -- Tranquilizing Shot
    { "19801",{
        "target.dispellable(19801)",
    },"target" },    
    -- Master's Call
    {"53271","player.state.root"},
    {"53271","player.state.snare"},
    -- Misdirection
    {"34477",{
        "Misdirection.pqicheck",
        "@CML.Misdirection()"
    }},          

    -- Pet Related Queues
    {"883","queuecast(883)",nil}, -- Call Pet 1 Queue
    {"83242","queuecast(83242)",nil}, -- Call Pet 2 Queue
    {"83243","queuecast(83243)",nil}, -- Call Pet 3 Queue
    {"83244","queuecast(83244)",nil}, -- Call Pet 4 Queue
    {"83245","queuecast(83245)",nil}, -- Call Pet 5 Queue
    {"2641",{ -- Dissmiss Pet Queue  
        "queuecast(2641)",
        "!modifier.last",
    },nil}, 

    -- Traps Queues   
    {"1499","queuecast(1499)","ground"}, -- Freezing Trap Queue
    {"82939","queuecast(82939)","ground"}, -- Explosive Trap Queue
    {"82948","queuecast(82948)","ground"}, -- Snakes Trap Queue     
    {"82941","queuecast(82941)","ground"}, -- Ice Trap Queue
    {"1543","queuecast(1543)","ground"}, -- Flare
    {"109248","queuecast(109248)","ground"}, -- BindingShot
    
    -- Ability Queues 
    {"82692","queuecast(82692)"}, -- Focus Fire Queue 
    {"121818","queuecast(121818)"}, -- Stampede Queue 
    {"5116","queuecast(5116)"}, -- Concussive Shot Queue 
    {"19801","queuecast(19801)"}, -- Tranq Shot Queue 
    {"20736","queuecast(20736)"}, -- Distracting Shot Queue 
    {"19503","queuecast(19503)"}, -- Scatter Shot Queue 
    {"82654","queuecast(82654)"}, -- Widow Venom Queue  
    {"883","@CML.PetManager(1)"}, -- Call Pet Slot 1
    {"83242","@CML.PetManager(2)"}, -- Call Pet Slot 2
    {"83243","@CML.PetManager(3)"}, -- Call Pet Slot 3
    {"83244","@CML.PetManager(4)"}, -- Call Pet Slot 4
    {"83245","@CML.PetManager(5)"}, -- Call Pet Slot 5
    {"982","@CML.PetManager(0)"}, -- Revive Pet                           
--------------------------------------------------Interrupts-------------------------------------------- 
    -- Interrupts
        -- Counter Shot
    {"InettruptMyAss",{ "@CML.Interrupts()" }},
--------------------------------------------------DPS Rotation-------------------------------------------- 
    -- virmens_bite_potion,if=buff.bloodlust.react|target.time_to_die<=60
-- /dump ProbablyEngine.dsl.get("pqicheck")("AgilityPotiononHeroism")
    {"#76089",{
        "AgilityPotiononHeroism.pqicheck",
        "@CML.DPSPotion(76089)",
    }},
    -- Auto Shot 
    {"PetMover",{
        "PetMoveToMouse.pqicheck",
        "PetMoveToMouse.pqikeybind",
        "@CML.PetMove()",
    }},
    -- Serpent Sting ,if=!ticking  
    {"1978",{
        "@CML.LastSerpent()",
        "!target.debuff(118253)",
    }},
    -- Gloves  
    {"#gloves",{ -- On CD
        "ProfessionsCDs.pqivalue = 2",
        "pet.alive",
        "target.exists",
    }},  
    {"#gloves",{ -- On ActiveCooldowns
        "macros(ActiveCooldowns)",
        "ProfessionsCDs.pqivalue = 1",
        "pet.alive",
        "target.exists",
    }},
    -- Rapid Fire ,if=!buff.rapid_fire.up  -- On CD
    {"3045",{
        "RapidFire.coolvalue = 2",
        "pet.alive",
        "target.exists",
        --"!player.buff(82692)", -- Not under focus fire
    }},    
    -- Rapid Fire ,if=!buff.rapid_fire.up  -- On ActiveCooldowns
    {"3045",{
        "macros(ActiveCooldowns)",
        "RapidFire.coolvalue = 1",
        "pet.alive",
        "target.exists",
        --"!player.buff(82692)", -- Not under focus fire
    }},
    -- Stampede ,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
    {"121818",{
        "player.spell.exists",
        "macros(ActiveCooldowns)",
        "Stampede.coolvalue = 1",
        "pet.alive",
        "target.exists",
    }},  
    -- Stampede ,if=buff.rapid_fire.up|buff.bloodlust.react|target.time_to_die<=25
    {"121818",{
        "player.spell.exists",
        "Stampede.coolvalue = 2",
        "pet.alive",
        "target.exists",
    },"target"},
    -- Dire Beast ,if=enabled&focus<=90
    {"120679",{
        "talent(11)",
    }}, 
    -- Auto Traps
    {"82939",{ -- Explosive Trap
        "ExplosiveTrap.pqicheck",
        "@CML.TrapExplosive()",
    },"ground"}, 
    {"82948",{ -- Snakes Trap
        "SnakesTrap.pqicheck",
        "@CML.TrapSnakes()",
    },"ground"},     
    {"82941",{  -- Ice Trap
        "IceTrap.pqicheck",
        "@CML.TrapIce()",
    },"ground"},   
    -- Explosive Trap ,if=active_enemies>1
    {"82939",{
        "ExplosiveTrap.pqicheck",
        "ExplosiveTrap.pqivalue = 1",
        "Traps.pqikeybind",
    },"ground"},
    -- Snakes Trap 
    {"82948",{
        "SnakesTrap.pqicheck",
        "SnakesTrap.pqivalue = 1",
        "Traps.pqikeybind",
    },"ground"},
    -- Ice Trap
    {"82941",{
        "IceTrap.pqicheck",
        "IceTrap.pqivalue = 1",
        "Traps.pqikeybind",
    },"ground"},
    -- Freezing Trap
    {"82941",{
        "FreezingTrap.pqicheck",
        "FreezingTrap.pqikeybind",
    },"ground"},
    -- Rocket Barrage
    {"69041",{ -- On CD
        "player.spell(69041).exists",
        "Racials.coolvalue = 2",
    }},
    {"69041",{ -- On ActiveCooldowns
        "player.spell(69041).exists",
        "Racials.coolvalue = 1",
        "macros(ActiveCooldowns)",
    }},    
    -- Kill Shot
    {"53351",{
        "target.health <= 20"
    }},    
    -- Focus Fire ,five_stacks=1,if=!ticking&!buff.beast_within.up -- On CD
    {"82692",{
        "FocusFire.coolvalue = 2",
        "pet.alive",
        "target.exists",
        "@CML.FocusFire()", -- 5 stacks of Frenzy
        "!player.buff(34471)", -- Not under bestial wrath
        --"!player.buff(3045)", -- Not under rapid fire
        "player.spell(19574).cooldown > 15",
    },"player"},
    -- Focus Fire ,five_stacks=1,if=!ticking&!buff.beast_within.up -- On ActiveCooldowns
    {"82692",{
        "macros(ActiveCooldowns)",
        "FocusFire.coolvalue = 1",
        "pet.alive",
        "target.exists",
        "@CML.FocusFire()", -- 5 stacks of Frenzy
        "!player.buff(34471)", -- Not under bestial wrath
        --"!player.buff(3045)", -- Not under rapid fire
        "player.spell(19574).cooldown > 15",
    },"player"},
    -- TODO -- blood_fury
    -- Fervor ,if=enabled&!ticking&focus<=65
    {"82726",{
        "talent(10)",
        "player.focus < 55",
    }},
    -- Bestial Wrath ,if=focus>60&!buff.beast_within.up -- On CD
    {"19574",{
        "BestialWrath.coolvalue = 2",
        "pet.alive",
        "target.exists",
        "player.focus > 60",
        "player.spell(34026).cooldown <= 3",
    }},
    -- Bestial Wrath ,if=focus>60&!buff.beast_within.up -- On ActiveCooldowns
    {"19574",{
        "macros(ActiveCooldowns)",
        "BestialWrath.coolvalue = 1",
        "pet.alive",
        "target.exists",
        "player.focus > 60",
        "player.spell(34026).cooldown <= 2",
        "player.spell(121818).cooldown >= 2",
    }},
    -- Multi Shot ,if=active_enemies>5|(active_enemies>1&buff.beast_cleave.down)
    {"2643",{
        "player.aoe != 1",
        "player.buff(34720)",
        "pet.buff(118455).duration <= 1",
        "player.focus >= 30",
        "!modifier.last",
    }},   
    {"2643",{
        "player.aoe != 1",
        "pet.buff(118455).duration <= 1",
        "player.focus >= 40",
        "!modifier.last",
    }},       
    -- Kill Command
    {"34026",{
        "target.petinmelee",
        "pet.alive",
        "@CML.KillCommand()",
    }},
    -- Glaive Toss ,if=enabled
    {"117050",{
        "talent(16)",
        --"!player.spell(34026).cooldown < 2", 
        --"player.focus >= 55",
    }},
    -- Cobra Shot if BW near to be ready    
    {"77767",{
        "BestialWrath.pqivalue = 2",
        "player.spell(19574).cooldown < 2",
        "player.focus < 45",
    }}, 
    {"77767",{
        "macros(ActiveCooldowns)",
        "BestialWrath.pqivalue = 1",
        "player.spell(19574).cooldown < 2",
        "player.focus < 55",
    }},
    -- A Murder of Crows ,if=enabled&!ticking
    {"131894",{ -- On CD
        "talent(13)",
        "AMurderofCrows.coolvalue = 2",
        "player.focus > 59", 
    }},    
    {"131894",{ -- On ActiveCooldowns
        "talent(13)",
        "macros(ActiveCooldowns)",
        "AMurderofCrows.coolvalue = 1",
        "player.focus > 59", 
    }}, 
    -- Lynx Rush ,if=enabled&!dot.lynx_rush.ticking
    {"120697",{
        "talent(15)",
    }},       
    -- Barrage ,if=enabled
     {"120360",{
        "talent(18)",
    }},    
    -- Powershot ,if=enabled
    {"109259",{
        "talent(17)",
    }},   
    -- Arcane Shot ,if=buff.thrill_of_the_hunt.react|buff.beast_within.up
    {"3044",{
        "player.aoe = 1",
        "talent(16)",
        "player.spell(117050).cooldown >= 2",
        "player.buff(34720)",
        "player.focus >= 41",
    }},
    {"3044",{
        "player.aoe = 1",
        "talent(16)",
        "player.spell(117050).cooldown >= 2",
        "player.buff(34720)",
        "player.buff(34471)",
        "player.focus >= 0",
    }}, 
    {"3044",{
        "player.aoe = 1",
        "talent(16)",
        "player.spell(117050).cooldown >= 2",
        "player.buff(34471)",
        "player.focus >= 51",
    }}, 
    {"3044",{
        "player.aoe = 1",
        "!talent(16)",
        "player.buff(34720)",
        "player.focus >= 41",
    }},
    {"3044",{
        "player.aoe = 1",
        "!talent(16)",
        "player.buff(34720)",
        "player.buff(34471)",
        "player.focus >= 0",
    }}, 
    {"3044",{
        "player.aoe = 1",
        "!talent(16)",
        "player.buff(34471)",
        "player.focus >= 51",
    }},     
    -- Focus Fire ,five_stacks=1 -- On CD
    {"82692",{
        "FocusFire.pqivalue = 2",
        "pet.alive",
        "target.exists",
        "@CML.FocusFire()", -- 5 stacks of Frenzy
        "!player.buff(34471)", -- Not under bestial wrath
        --"!player.buff(3045)", -- Not under rapid fire
        "player.spell(19574).cooldown > 15",
    },"player"},
    -- Focus Fire ,five_stacks=1 -- On ActiveCooldowns
    {"82692",{
        "macros(ActiveCooldowns)",
        "FocusFire.pqivalue = 1",
        "pet.alive",
        "target.exists",
        "@CML.FocusFire()", -- 5 stacks of Frenzy
        "!player.buff(34471)", -- Not under bestial wrath
        --"!player.buff(3045)", -- Not under rapid fire
        "player.spell(19574).cooldown > 15",
    },"player"},
    -- Cobra Shot,if=dot.serpent_sting.remains<6
    {"77767",{
        "!target.debuff(118253).duration > 6",
    }},
    -- Cobra Shot -- Stack Focus
    {"77767",{
        "StackFocus.pqicheck",
        "StackFocus.pqikeybind",
        "player.focus < 82",
    }}, 
    -- Arcane Shot ,if=focus>=61
    {"3044",{
        "player.aoe = 1",
        "player.focus >= 65",
    }},
    -- Multi Shot ,if=focus>=91
    {"2643",{
        "player.aoe = 2",
        "player.focus >= 95",
    }},    
    {"2643",{
        "player.aoe = 2",
        "player.focus >= 75",
        "player.buff(34471)",
    }},      
    -- Cobra Shot if BW near to be ready    
    {"77767"},
    -- Cobra Shot
    --{"77767"}
}, 
--------------------------------------------------Out of Combat-------------------------------------------- 
{ 
    -- PQI Globals 
    {"TaMere","@CML.PQIConfing()"},
    -- Player Status
    {"TaMere","@CML.Status()"}, 
    {"pause","player.buff(5384)"}, -- Pause for Feign Death 
    {"PetManager","@CML.PetManager()"},
    -- Aspect Swapping
    {"5118",{
        "!toggle.pack",
        "ActiveAspects.pqicheck",
        "@CML.Aspects(2)",
        "!player.buff(5118)"
    },"player"},
    {"13159",{
        "toggle.pack",
        "ActiveAspects.pqicheck",
        "@CML.Aspects(2)",
        "!player.buff(13159)"
    },"player"},

    -- Aspect of the Iron Hawk
    {"109260",{ 
        "ActiveAspects.pqicheck",
        "target.exists",
        "@CML.Aspects(1)",
        "player.spell(109260).exists",
        "player.stance != 1",
    }},
    -- Aspect of the Hawk
    {"13165",{
        "ActiveAspects.pqicheck",
        "target.exists",
        "@CML.Aspects(1)",
        "player.spell(13165).exists",
        "player.stance != 1",
    }},

    -- Hunters Mark
    {"1130",{
        "target.exists",
        "@CML.HuntersMark()",
        "!target.debuff(1130).any"
    },"target"},
    {"PetMover",{
        "PetMoveToMouse.pqicheck",
        "PetMoveToMouse.pqikeybind",
        "@CML.PetMove()",
    }},

}) 