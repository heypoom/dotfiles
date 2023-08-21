require('hs.ipc')

local stackline = require "stackline"
stackline:init()

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:andUse("MouseCircle", {
	config = {
		color = hs.drawing.color.osx_red,
	},
	hotkeys = {
		show = { { "ctrl", "cmd", "alt" }, "d" }
	}
})
