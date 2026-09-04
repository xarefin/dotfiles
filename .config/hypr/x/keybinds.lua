---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "thunar"
local menu = "rofi -show drun"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/kill.sh"))

-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.layout("togglesplit"))    -- dwindle only

--fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())



-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end



-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + SHIFT + M",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + M", hl.dsp.window.move({ workspace = "special:magic" }))



-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness using custom scripts
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --dec"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --toggle-mic"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/brightness.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/brightness.sh --dec"), { locked = true, repeating = true })


hl.bind(mainMod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --mic-inc"), { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --mic-dec"), { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioMute",        hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --toggle-mic"), { locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Lock screen bind 
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprlock -c ~/.config/hypr/hyprlock.conf"))

-- Move focus with mainMod + HJKL (Vim style)
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move active window with mainMod + SHIFT + HJKL (Vim style)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Hyprshot and satty 
hl.bind("CTRL + SHIFT + S", hl.dsp.exec_cmd([[hyprshot -m region --raw | satty --filename - --output-filename /home/arefin/Pictures/Screenshots/Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png]]))


hl.bind("SUPER + x", hl.dsp.exec_cmd("~/.config/hypr/scripts/emoji.sh"))


hl.bind(mainMod .. " + W", hl.dsp.exec_cmd('rofi -show wallpaper -modi "wallpaper:' .. os.getenv("HOME") .. '/.config/hypr/scripts/paper.sh" -theme-str "mainbox { children: [ \\"inputbar\\", \\"listview\\" ]; } listview { columns: 2; lines: 3; spacing: 12px; } element-text { enabled: false; } element-icon { size: 144px; horizontal-align: 0.5; } element { orientation: vertical; padding: 7px; }"'))





-- Resize windows with SUPER + SHIFT + Arrow Keys
hl.bind(mainMod .. " + SHIFT + left",  function() hl.dispatch(hl.dsp.window.resize({ x = -50, y = 0, relative = true })) end, { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", function() hl.dispatch(hl.dsp.window.resize({ x = 50, y = 0, relative = true })) end, { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    function() hl.dispatch(hl.dsp.window.resize({ x = 0, y = -50, relative = true })) end, { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  function() hl.dispatch(hl.dsp.window.resize({ x = 0, y = 50, relative = true })) end, { repeating = true })



-- SUPER + V: Select, auto-paste, and notify
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/clip.sh paste"))

-- SUPER + SHIFT + V: Wipe history with icon notification
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/clip.sh wipe"))

-- ALT + Delete: Delete latest item with icon notification
hl.bind("ALT + Delete", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/clip.sh delete"))











-- Cycle workspaces forward with Tab (loops 1 -> 10 -> 1)
hl.bind(mainMod .. " + Tab", function()
    local ws = hl.get_active_workspace()
    if not ws then return end
    local target = ws.id + 1
    if target > 10 then target = 1 end
    hl.dispatch(hl.dsp.focus({ workspace = target }))
end)

-- Move active window forward with SHIFT + Tab (loops 1 -> 10 -> 1)
hl.bind(mainMod .. " + SHIFT + Tab", function()
    local ws = hl.get_active_workspace()
    if not ws then return end
    local target = ws.id + 1
    if target > 10 then target = 1 end
    hl.dispatch(hl.dsp.window.move({ workspace = target }))
end)

-- Scroll down: go forward through workspaces (loops 1 -> 10 -> 1)
hl.bind(mainMod .. " + mouse_down", function()
    local ws = hl.get_active_workspace()
    if not ws then return end
    local target = ws.id + 1
    if target > 10 then target = 1 end
    hl.dispatch(hl.dsp.focus({ workspace = target }))
end)

-- Scroll up: go backward through workspaces (loops 10 -> 1 -> 10)
hl.bind(mainMod .. " + mouse_up", function()
    local ws = hl.get_active_workspace()
    if not ws then return end
    local target = ws.id - 1
    if target < 1 then target = 10 end
    hl.dispatch(hl.dsp.focus({ workspace = target }))
end)