local utils = require("__speedrun/utils")
local d = utils.dialog
local tp = utils.tp
local skipIdx = 3

local function skip(idx)
	return function()
		return skipIdx == idx
	end
end

return {
	[0] = {
		-- shortcuts
		{"when",{skip(1)},{{tp(-159584,-160128)}}}, -- end sect 2
		{"when",{skip(2)},{{tp(-139312,-140320)}}}, -- end sect 3
		{"when",{skip(3)},{{tp(-117120,-120160)}}}, -- end sect 4
		-- up the shaft
		"jln",{{1},{"md"}},
		"ln",{1},
		"j",{{1},{"md"}},
		"",{1},
		{"dotimes",2,{
			"jrn",{{1},{"md"}},
			"rn",{1},
		}},
		"jln",{{1},{"md"}},
		"ln",{1},
		"jrn",{{1},{"md"}},
		"rn",{1},
		-- across to the door
		"jrn",{25},
		"rn",{"x",">=",-199200},
		"jrn",{2},
		"rn",{"x",">=",-199008},
		"jrn",{{1},{"md"}},
		"u",{1000},
	},
	{ -- 1
		"",{"nfs"},
		"jrn",{{1},{"md"}},
		"rn",{"x",">=",-179552},
		"jrn",{{1},{"md"}}, -- hit the 2nd fall block
		"",{26},
		"rn",{{"tg"},{8}}, -- barely touch the right edge of the platform to break fall
		"jrn",{{1},{"md"}},
		"rn",{"x",">=",-179232},
		"jrn",{28},
		"rn",{8},
		"ln",{"md"},
		"jln",{{1},{"md"}}, -- hit fall block 3
		"ln",{36},
		"rn",{"x",">=",-178784-48}, -- enter the small passage with as much speed as possible
		{"dotimes",2,{
			"jrn",{{1},{"md"}},
			"rn",{1},
		}},
		"jrn",{17},
		"ln",{7},
		"rn",{"x",">=",-178496}, -- skip fall block 4
		-- around to fall block 5
		"jrn",{1},
		"rn",{{"x",">=",-178336},{2}},
		"jrn",{{1},{"md"}},
		"ln",{"x","<=",-178304},
		"jln",{{1},{"md"}},
		"ln",{"x","<=",-178432},
		"jrn",{{1},{"md"}},
		"u",{1000},
	},
	{ -- 2
		-- shortcut to section 3
		{"when",{skip(1)},{"u",{1000}}},
		
		"rn",{{"x",">=",-159808},{4}},
		"jrn",{{1},{"md"}},
		"",{15},
		"rn",{"y",">=",-160192}, -- skip the second go-around by avoiding the breakable platform
		"lun",{1000},
	},
	{ -- 3
		{"when",{skip(2)},{"u",{1000}}},
		
		"rn",{"x",">=",-139776},
		"jrn",{{1},{"md"}},
		"rn",{1},
		"jrn",{{1},{"md"}},
		"",{48},
		"l",{{"y",">=",-140032-32},{1}},
		"rn",{"tg"},
		"jrn",{{1},{"md"}},
		"rn",{1},
		{"dotimes",2,{
			"jln",{{1},{"md"}},
			"ln",{1},
		}},
		"j",{{1},{"md"}},
		"",{1},
		"jrn",{9},
		"run",{1000},
	},
	{ -- 4
		{"when",{skip(3)},{"u",{"fs"}}},
	
		"jrn",{{1},{"md"}},
		"rn",{1},
		"jrn",{1},
		"rn",{{"x",">=",-119392},{6}},
		"jrn",{{1},{"md"}},
		"",{"tg"},
		"j",{{1},{"md"}},
		"rn",{"tg"}, -- jump on the frame when Mario lands, keeping the falling effect active (frame-perfect)
		"jrn",{4},
		"rn",{28},
		"ln",{{"sy","<=",0},{11}},
		"jrn",{{1},{"md"}},
		"rn",{2},
		"j",{{1},{"md"}},
		"",{23},
		"rn",{"tg"},
		"jrn",{{1},{"md"}},
		"rn",{"x",">=",-118720},
		"jr",{{1},{"md"}},
		"ln",{1},
		"jln",{{1},{"md"}},
		"rn",{1},
		"jrn",{{1},{"md"}},
		"rn",{{"tg"},{16}},
		"jrn",{{1},{"md"}},
		"",{15},
		"rn",{"tg"},
		"jrn",{{1},{"md"}},
		"rn",{10},
		"jrn",{16},
		"r",{"md"},
		"",{1},
		"j",{{1},{"md"}},
		"",{18},
		"rn",{"x",">=",-117920},
		"jln",{"ml"},
		"j",{"md"},
		"",{11},
		"ln",{{"x","<=",-118016}},
		"jln",{{1},{"md"}},
		"ln",{6},
		-- {d("jump")},
		"jrn",{"mr"},
		-- {d("move right")},
		"j",{"md"},
		{"dotimes",2,{
			"",{1},
			"j",{{1},{"md"}},
		}},
		"ln",{27},
		"rn",{"mr"},
		"",{2},
		"rn",{"x",">=",-117696},
		"jrn",{12},
		"jln",{"ml"},
		"j",{"md"},
		{"dotimes",2,{
			"",{1},
			"j",{{1},{"md"}},
		}},
		"",{10},
		"rn",{{"x",">=",-117344}},
		"jrn",{{1},{"md"}},
		"ln",{6},
		-- "jln",{"sx","<=",0.5},
		"jln",{{1},{"md"}},
		"",{1},
		"jrn",{{1},{"md"}},
		"rn",{10},
		"",{25},
		"rn",{{"x",">=",-117184},{1}},
		"jrun",{"fs"},
	},
	{ -- section 5
		"",{"nfs"},
		"jrn",{11},
		"rn",{"x",">=",-99264},
		"jln",{9},
		"ln",{{"x","<=",-99360},{2}},
		"jln",{{1},{"md"}},
		-- Skip: the crumbling blocks can be broken from inside, allowing us to come in from the side and stop falling low enough to pass
		-- the right wall. This makes it so we only have to go up once here.
		"",{10},
		"rn",{{"x",">=",-98944},{2}},
		
		"jln",{"ml"},
		"j",{"md"},
		"",{1},
		"jrn",{{1},{"md"}},
		"rn",{1},
		"jrn",{{1},{"md"}},
		"rn",{{"x",">=",-98656},{2}},
		"jrn",{1},
		"rn",{{"x",">=",-98560},{2}},
		"ln",{8},
		"jln",{{1},{"md"}},
		"ln",{{"x","<=",-98560},{13}},
		"jln",{{1},{"md"}},
		"ln",{"y",">=",-100352},
		"rn",{"tg"},
		"jln",{"ml"},
		"j",{"md"},
		"",{4},
		"j",{8},
		"",{"md"},
		"jln",{14},
		"ln",{24},
		"jrn",{{1},{"md"}},
		"rn",{{"x",">=",-98656},{9}},
		"jrn",{1},
		"",{12},
		"rn",{120},
	}
}
