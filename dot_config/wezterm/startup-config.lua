--- wezterm.lua
--- $ figlet -f small Wezterm
--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_|
---
--- My Wezterm config file
--
-- Got this from: https://github.com/theopn/dotfiles/blob/main/wezterm/wezterm.lua

local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local session_manager = require("wezterm-session-manager/session-manager")

local zsh_path = "/usr/bin/zsh"

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.default_prog = { zsh_path, "-l" }
config.enable_wayland = false

wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

wezterm.on("gui-startup", function(cmd)
	local tab_main, pane_main, window_main = mux.spawn_window(cmd or {})
	window_main:spawn_tab({
		cwd = "/home/alfarizi/notes",
	})

	local tab_config, pane_config, window_config = mux.spawn_window({
		workspace = "config",
		cwd = "/home/alfarizi/.config/nvim",
	})
	window_config:spawn_tab({
		cwd = "/home/alfarizi/.config/wezterm",
	})
	window_config:spawn_tab({
		cwd = "/home/alfarizi/.config/hypr",
	})

	mux.spawn_window({
		workspace = "personal-projects",
		cwd = "/home/alfarizi/dev/personal-projects",
	})

	mux.spawn_window({
		workspace = "skripsi",
		cwd = "/home/alfarizi/dev/skripsi/skripsi",
	})
end)

-- local function name_and_new_workspace(window)
-- 	-- Prompt the user to enter a name for the workspace
-- 	window:show_text_input_box({
-- 		title = "Name Your Workspace",
-- 		prompt = "Please enter a name for the new workspace:",
-- 	}, function(name)
-- 		if name ~= nil and name ~= "" then
-- 			-- Create a new workspace with the entered name
-- 			window:perform_action(
-- 				wezterm.action({
-- 					SpawnCommandInNewWorkspace = {
-- 						args = { zsh_path },
-- 						workspace = name,
-- 					},
-- 				}),
-- 				window
-- 			)
-- 		end
-- 	end)
-- end

-- wezterm.on("update-right-status", function(window, pane)
-- 	window:set_right_status(wezterm.format({
-- 		{ Text = "Workspace: " .. window:active_workspace() .. "  " },
-- 	}))
-- end)

config.color_scheme = "Tokyo Night"
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", scale = 1.25, weight = "Medium" },
	{ family = "Iosevka Nerd Font", scale = 1.2, weight = "Medium" },
	{ family = "FantasqueSansM Nerd Font", scale = 1.3 },
})
config.window_background_opacity = 0.9
config.text_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

-- Keys
config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 3000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER|ALT", action = act.SendKey({ key = "a", mods = "ALT" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

	-- Disable zoom in and zoom out (it cause low resolution on wayland)
	{ key = "=", mods = "CTRL", action = act.SendKey({ key = "a", mods = "ALT" }) },
	{ key = "-", mods = "CTRL", action = act.SendKey({ key = "a", mods = "ALT" }) },
	{ key = "=", mods = "SUPER", action = act.SendKey({ key = "a", mods = "ALT" }) },
	{ key = "-", mods = "SUPER", action = act.SendKey({ key = "a", mods = "ALT" }) },
	{ key = "+", mods = "CTRL", action = act.SendKey({ key = "a", mods = "ALT" }) },
	{ key = "_", mods = "CTRL", action = act.SendKey({ key = "a", mods = "ALT" }) },
	{ key = "+", mods = "CTRL|SHIFT", action = act.SendKey({ key = "a", mods = "ALT" }) },
	{ key = "_", mods = "CTRL|SHIFT", action = act.SendKey({ key = "a", mods = "ALT" }) },

	-- Pane keybindings
	{ key = "|", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},

	-- Tab keybindings
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	-- { key = "n", mods = "LEADER", action = act.ShowTabNavigator },
	{
		key = "e",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Renaming Tab Title...:" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
	-- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
	{ key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

	-- Workspace
	{ key = "s", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "WORKSPACES" }) },
	-- {
	-- 	key = "n",
	-- 	mods = "LEADER",
	-- 	action = act.PromptInputLine({
	-- 		description = wezterm.format({
	-- 			{ Attribute = { Intensity = "Bold" } },
	-- 			{ Foreground = { AnsiColor = "Fuchsia" } },
	-- 			{ Text = "Create Workspace with Title: " },
	-- 		}),
	-- 		action = wezterm.action_callback(function(window, pane, line)
	-- 			if line ~= nil and line ~= "" then
	-- 				-- Create a new workspace with the entered name
	-- 				window:perform_action(
	-- 					wezterm.action({
	-- 						SpawnCommandInNewWorkspace = {
	-- 							args = { zsh_path },
	-- 							workspace = line,
	-- 						},
	-- 					}),
	-- 					window
	-- 				)
	-- 			end
	-- 		end),
	-- 	}),
	-- },

	-- Session manager
	{ key = "S", mods = "LEADER", action = act({ EmitEvent = "save_session" }) },
	{ key = "L", mods = "LEADER", action = act({ EmitEvent = "load_session" }) },
	{ key = "R", mods = "LEADER", action = act({ EmitEvent = "restore_session" }) },

	-- Paste
	-- paste from the clipboard
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	-- paste from the primary selection
	-- { key = "V", mods = "CTRL", action = act.PasteFrom("PrimarySelection") },
}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false
wezterm.on("update-status", function(window, pane)
	-- Workspace name
	local stat = window:active_workspace()
	local stat_color = "#f7768e"
	-- It's a little silly to have workspace name all the time
	-- Utilize this to display LDR or current key table name
	if window:active_key_table() then
		stat = window:active_key_table()
		stat_color = "#7dcfff"
	end
	if window:leader_is_active() then
		stat = "LDR"
		stat_color = "#bb9af7"
	end

	local basename = function(s)
		-- Nothing a little regex can't fix
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- Current working directory
	local cwd = pane:get_current_working_dir()
	if cwd then
		if type(cwd) == "userdata" then
			-- Wezterm introduced the URL object in 20240127-113634-bbcac864
			cwd = basename(cwd.file_path)
		else
			-- 20230712-072601-f4abf8fd or earlier version
			cwd = basename(cwd)
		end
	else
		cwd = ""
	end

	-- Current command
	local cmd = pane:get_foreground_process_name()
	-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
	cmd = cmd and basename(cmd) or ""

	-- Time
	local time = wezterm.strftime("%H:%M")

	-- Left status (left of the tab line)
	window:set_left_status(wezterm.format({
		{ Foreground = { Color = stat_color } },
		{ Text = "  " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
		{ Text = " |" },
	}))

	-- Right status
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)

--[[ Appearance setting for when I need to take pretty screenshots
config.enable_tab_bar = false
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0cell',

}
--]]

return config
