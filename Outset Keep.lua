local utils = require("__speedrun/utils")
local d = utils.dialog
local tp = utils.tp
local skipIdx = 1
local hp = utils.hp
local sst = utils.sst
local vsi = utils.vsi
local warp = utils.warp
local endWarp = utils.endWarp

local function skip(idx)
	if idx == null then
		return function()
			return skipIdx > 0
		end
	else
		return function()
			return skipIdx == idx
		end
	end
end

local function setHP(amt)
	return function()
		i = player:mem(0x16, FIELD_WORD)
		while i < amt do
			i = i + 1
			NPC.spawn(250, player.x, player.y, player.section)
		end
		return -1
	end
end

return {
	[0] = {
		-- shortcut to the next section (testing only)
		{"when",{skip()},{{warp()}}},
		{"when",{skip(1)},{
			{tp(-195904,-200304)},
			{setHP(2)},
			"",{1},
			"u",{math.huge},
		}},
	
		-- Wosu #1
		"r",{{"ntg"},{"tg"}},         -- run right until landing on the lower ledge to the right
		"jr",{"md"},                  -- jump up to grab the pendant
		"r",{{"tg"},{"ntg"},{"tg"}},  -- run right until landing on the ground below and to the right of the pendant
		"jr",{1},                     -- do a minjump toward the Wosu on this platform
		"drn",{"md"},                 -- lowstab the Wosu just after jumping so Link doesn't lose any momentum (stabbing while standing on the ground sets speed to 0 and normal stab is too high to hit)
		
		-- Wosu #2
		"r",{"tg"},                   -- run right until landing back on the ground
		"jr",{1},                     -- jump to the slightly higher platform on the right
		"r",{12},                     -- wait just long enough so the stab will hit the next Wosu, but will still end before touching the ground
		"drn",{1},                    -- stab the Wosu before landing on its platform
		
		-- Wosu #3
		"r",{{"tg"},{"ntg"},{"tg"}},  -- run right to the slightly lower ledge to the right
		"jr",{1},                     -- do a minjump toward the next Wosu
		"r",{8},                      -- wait until a lowstab will hit
		"drn",{1},                    -- lowstab the Wosu
		
		-- Climbing Wall #1
		"r",{{"x",">=",-198112},{1}}, -- run right to the very edge of the platform
		"jr",{"md"},                  -- do a maxjump toward the climbable wall
		"drn",{{"sx","<=",0},{1}},    -- stab the climbable wall at the peak of the jump
		"jr",{1},                     -- do a minjump up to the top of the wall
		
		-- Climbing Wall #2 skip
		"r",{85},                     -- run off the right edge of the wall
		"",{18},                      -- slow down just enough to avoid hitting the wall to the right
		"r",{"tg"},                   -- pass under the wall to the right to land on the platform below, skipping the climbable wall to the left
		"jr",{"md"},                  -- jump up to the platform to the right
		
		-- Climbing Wall #3
		"r",{{"tg"},{10}},            -- wait for just long enough that stabbing at the peak of the jump will attach Link to the wall
		"jr",{"md"},                  -- jump toward the wall
		"drn",{{"sx","<=",0},{1}},    -- lowstab the wall
		"jr",{6},                     -- jump just to the top of the wall
		
		-- Snifit #1 (the second in the level)
		"r",{60},                     -- run off the right end of the platform
		"",{8},                       -- slow down just enough not to hit the wall above the Snifit
		"r",{"tg"},                   
		"jr",{1},                     -- jump toward the Snifit
		"drn",{1},                    -- lowstab it
		
		-- Bomb Wall #1
		"r",{"tg"},
		"jr",{4},                         -- jump onto the vase with the bomb spawner
		"r",{{"tg"},{"ntg"},{"tg"}},      -- pick up the bomb
		"rt",{1},                         -- throw the bomb at the breakable wall
		"r",{{"sx",">",0},{8}},
		"jr",{1},                         -- jump through the opening
		"r",{{1},{"tg"},{"ntg"},{"tg"}},
		"jr",{3},                         -- jump up to the platform with the door
		"ru",{math.huge},                 -- enter the door
	},
	{ -- 1
		
		-- Wosus #1-2 
		"r",{{"tg"},{"ntg"},{"tg"},{"ntg"},{"tg"},{16}},  -- run right and pick up the pendant
		"jr",{8},                                         -- jump high enough to land on the platform up and to the right
		"r",{15},                                         -- wait just long enough that a single stab will hit both Wosus, but end before touching the ground
		"drn",{1},                                        -- kill both Wosus in a single stab
		
		-- Snifit #1
		"r",{"tg"}, -- wait until landing from stabbing the Wosus
		"jr",{8},   -- jump up to where the Snifit is standing
		"r",{8},    -- wait until the stab will hit it
		"drn",{1},  -- stab it
		
		-- Wosu #3
		"r",{"tg"},        -- land on the Snifit's platform
		"jr",{4},          -- jump off the platform toward the Wosu
		"r",{{1},{"md"}}, 
		"jdr",{"mu"},      -- downstab the Wosu
		
		-- Climbing Wall #1
		"jr",{8},                  -- bounce up from the stab toward the Climbing Wall
		"rn",{{"sx","<=",0},{1}},  -- stab the wall
		"j",{9},                   -- jump up to the top of the wall
		
		-- Snifit #2
		"r",{{"tg"},{4}}, -- run toward the Snifit
		"jr",{1},         -- jump at it
		"jdrn",{3},       -- lowstab it. This doesn't quite get us over the edge, but Link needs to lose vertical speed, or he'll fall too fast and hit the left side of the platform far below, falling to his death.
		
		-- Climbing Wall #2 Skip
		"r",{39},
		"l",{13},    -- slow down just enough to miss the left side of the pillar
		"r",{"tg"},  -- move to land safely on the low platform without using the climbinb wall
		
		-- Spinies #1
		"jr",{4},              -- jump onto the vase
		"r",{{"tg"},{"ntg"}},  -- run off the right edge of it
		"rt",{1},              -- throw a bomb at the Spinies
		"l",{"ml"},            -- come to a complete stop so the Spinies will die before we get to them
		"jr",{11},             -- jump up to land on the Spinies' platform as soon as possible
		"r",{"tg"},
		
		-- Climbing Wall #3 and Spinies #2
		"jr",{2},
		"jl",{"ml"},        -- stop just to the right of the wall
		"j",{8},
		"jn",{"md"},        -- stab the wall
		"",{1},
		"jr",{4},           -- jump just far enough to the right that the bomb will hit the Spinies and the breakable wall
		"j",{"md"},
		"jlt",{1},          -- throw a bomb at the spinies and the breakable wall
		"l",{9},
		"ln",{{"mr"},{1}},  -- stab the climbable wall
		"jr",{{1},{"md"}},  -- jump up to the Spinies' platform
		
		-- Snifit #3
		"r",{{"tg"},{"ntg"}},  -- run off the edge of the platform
		"l",{6},               -- slow down just enough to avoid hitting the pillar to the right
		"r",{"tg"},
		"jr",{8},              -- jump over the Spiny
		"r",{"tg"},
		"jr",{16},             -- jump to land on the Snifit
		"r",{"md"},
		"dr",{"mu"},           -- downstab it
		
		-- Wosu #4
		"r",{"md"},            -- bounce to land on the Wosu
		"dr",{"mu"},           -- downstab it
		
		-- Snifit #4
		"r",{"md"},            -- bounce to land on the Snifit
		"jdr",{"mu"},          -- downstab it
		
		-- Wosu #5
		"jr",{8},
		"r",{"md"},            -- bounce to land on the Wosu
		"jdr",{"mu"},          -- downstab it
		
		-- Wosu #6
		"jr",{4},
		"r",{"md"},            -- bounce to land on the Wosu
		"jdr",{"mu"},          -- downstab it
		
		-- Snifit #5
		"jr",{4},
		"r",{"md"},            -- bounce to land on the Snifit
		"jdr",{"mu"},          -- downstab it
		
		-- Wosu group #1 and Spike Pit #1
		"jr",{"md"},              -- wait until the peak of the jump
		"rt",{1},                 -- throw a bomb at the Wosus
		"r",{"tg"},               -- land on the pillar just to the left of them
		"jl",{14},                -- do the smallest jump possible that will keep us above the explosion
		"l",{"ml"},
		"",{13},                  -- wait until moving right won't make us hit the pillar
		"dr",{"x",">=",-175840},  -- bounce across the spikes
		
		-- Spike Pit #2 and Wosu #7
		"r",{{"tg"},{"ntg"}},   -- run off the edge of the platform
		"dr",{{"mu"},{"md"}},   -- bounce across the spikes
		"jdr",{{"mu"},{8}},
		"jdrn",{"md"},          -- do a maxjump onto the Wosu's platform, hitting it with a lowstab on the way up
		
		-- Spike Pit #3 (with breakable wall)
		"r",{{"tg"},{"ntg"}},  -- run off the right edge of the platform
		"dr",{"mu"},           -- bounce off the spikes
		"r",{"md"},
		"jdlt",{14},           -- throw a bomb at the peak of the jump to break the wall and slow down so we'll arrive after the explosion
		"jr",{"md"},           -- bounce up onto the pillar at the bottom of the opening
		
		-- Spike Pit #4 (with climbable wall)
		"r",{{"tg"},{"ntg"},{"tg"},{"ntg"}}, -- Run off the right side of the pillar and the platform below
		"jdr",{{"mu"},{9}},                  -- Bounce off the spikes toward the right climbing wall
		"jrn",{"sx","<=",0},                 -- stab it
		"",{1},                              -- must wait for one tick after stabbing the wall before we can jump
		"jl",{7},                            -- jump toward the left climbing wall
		"jln",{"sx",">=",0},                 -- stab it
		"",{1},
		
		-- Spike Pit #4 (with 2 Wosus and a Snifit)
		"jr",{{1},{"md"}},         -- jump onto the first Wosu's platform
		"r",{"tg"},
		"jr",{1},                  -- jump at the Wosu and off the platform
		"rn",{1},                  -- stab it
		"jdr",{{"md"},{"mu"},{1}}, -- bounce off the higher spikes
		"r",{"md"},
		"dr",{"mu"},               -- spare the second Wosu (killing it slows us down) and bounce off the spikes to the right of it
		{endWarp()},
		
		-- Bottomless pit and final platform leading to the boss.
		"r",{"tg"},
		"jr",{"md"}, -- jump over the pit
		"r",{"tg"},
		"jr",{1},
		"r",{{1},{"tg"}},
		"jr",{1},
		"ru",{math.huge},
	},
}
