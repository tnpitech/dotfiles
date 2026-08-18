-- Monitors
hl.monitor({
	output = "eDP-1",
	mode = "preferred",
	position = "auto",
	scale = "1",
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "preferred",
	position = "auto",
	scale = "1",
})

-- Programs
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "pkill rofi || bash ~/.config/rofi/launcher.sh"
local waybar = "waybar"
local awww = "awww-daemon"

local restartWaybar = "~/.config/waybar/scripts/launch.sh"
local exitHyprland = "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
local setCursor = "hyprctl setcursor macOS 24"
local screenshot = 'grim -g "$(slurp)" - | satty --filename - --copy-command wl-copy'

-- Autostarts
hl.on("hyprland.start", function()
	hl.exec_cmd(waybar)
	hl.exec_cmd(awww)
	hl.exec_cmd(setCursor)
	hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland")
	hl.exec_cmd("/usr/lib/xdg-desktop-portal-gtk")
	hl.exec_cmd("/usr/lib/xdg-desktop-portal")
end)

-- Environment variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Look and feel
hl.config({
	cursor = {
		hide_on_key_press = true,
		inactive_timeout = 1,
	},
	general = {
		gaps_in = 3,
		gaps_out = 5,
		border_size = 2,
		col = {
			active_border = "#3A3A3C",
			inactive_border = "#2C2C2E",
		},
		resize_on_border = false,
		allow_tearing = true,
		layout = "scrolling",
	},
	decoration = {
		rounding = 10,
		rounding_power = 10,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 8,
			color = 0xee121212,
		},
		blur = {
			enabled = true,
			size = 20,
			passes = 5,
			vibrancy = 0.1696,
			new_optimizations = true,
		},
	},
	animations = {
		enabled = true,
	},
})

-- Animations
hl.curve("specialWorkSwitch", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("emphasizedAccel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("emphasizedDecel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("standard", { type = "bezier", points = { { 0.2, 0 }, { 0, 1 } } })

-- Animation configs
hl.animation({ leaf = "layersIn", enabled = true, speed = 6, bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 6, bezier = "emphasizedAccel", style = "slide" })
hl.animation({ leaf = "fadeLayers", enabled = true, speed = 6, bezier = "standard" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "emphasizedDecel" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 6, bezier = "emphasizedAccel" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "standard" })

hl.animation({
    leaf    = "specialWorkspace",
    enabled = true,
    speed   = 4,
    bezier  = "specialWorkSwitch",
    style   = "slidefadevert 15%"
})
hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 6, bezier = "standard" })
hl.animation({ leaf = "border", enabled = true, speed = 6, bezier = "standard" })

-- Layout
hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		explicit_column_widths = "0.5, 1.0",
		fullscreen_on_one_column = true,
	},
})

-- Misc
hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

-- Input
hl.config({
	input = {
		kb_layout = "us,th",
		kb_variant = ",",
		kb_model = "",
		kb_options = "caps:escape,grp:ctrl_space_toggle",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		repeat_delay = 200,
		repeat_rate = 35,
		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

-- Keybinds
local mainMod = "SUPER"
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(restartWaybar))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(screenshot))
-- scrolling layout
hl.bind(mainMod .. " + H", hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + L", hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + F", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + K", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(exitHyprland))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Windows and Workspaces rules
hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- hl.window_rule({
-- 	match = { class = "org.gnome.Nautilus" },
-- 	opacity = "0.85 override",
-- })
-- hl.window_rule({
-- 	match = { class = "xdg-desktop-portal-gtk" },
-- 	opacity = "0.9 override",
-- 	size = { 900, 600 },
-- 	float = true,
-- 	center = true,
-- })

hl.window_rule({
	match = { class = "org.nmrs.ui" },
	float = true,
	size = { 650, 600 },
})
hl.window_rule({
	match = { class = "org.pulseaudio.pavucontrol" },
	float = true,
	size = { 650, 600 },
})
hl.layer_rule({
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0.5,
})
hl.layer_rule({
	match = { namespace = "waybar" },
	blur = true,
})
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- HyprMod managed settings
require("hyprland-gui")
