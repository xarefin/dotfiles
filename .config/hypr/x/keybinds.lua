---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show drun"
local mainMod     = "SUPER" -- Sets "Windows" key as main modifier
local browser     = "firefox"
local browserz       = "brave"
---------------------
---- CORE BINDS -----
---------------------

hl.bind(mainMod .. " + Return",        hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",             hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Space",         hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Escape",        hl.dsp.exec_cmd("hyprlock -c ~/.config/hypr/hyprlock.conf"))
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + SHIFT + Q",     hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/kill.sh"))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(browser)                              )
hl.bind(mainMod .. " + CTRL + SHIFT + Return", hl.dsp.exec_cmd(browserz))

---------------------
--- WINDOW MANAGEMENT
---------------------

hl.bind(mainMod .. " + Q",             hl.dsp.window.close())
hl.bind(mainMod .. " + F",             hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + P",             hl.dsp.window.pseudo())
hl.bind(mainMod .. " + R",             hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F",     hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/close-all.sh"))
hl.bind(mainMod .. " + ALT + F",       hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))




---------------------
---- WINDOW FOCUS ---
---------------------

hl.bind(mainMod .. " + H",             hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J",             hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K",             hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L",             hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K",     hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "right" }))


---------------------
---- RESIZE WINDOWS -
---------------------

hl.bind(mainMod .. " + SHIFT + left",  function() hl.dispatch(hl.dsp.window.resize({ x = -50, y = 0, relative = true })) end, { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", function() hl.dispatch(hl.dsp.window.resize({ x = 50,  y = 0, relative = true })) end, { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",    function() hl.dispatch(hl.dsp.window.resize({ x = 0,  y = -50, relative = true })) end, { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",  function() hl.dispatch(hl.dsp.window.resize({ x = 0,  y = 50,  relative = true })) end, { repeating = true })


---------------------
---- WORKSPACES -----
---------------------

-- Switch workspaces with mainMod + [0-9] and move active window with SHIFT
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Cycle workspaces forward/backward (Tab & Mouse Scroll)
hl.bind(mainMod .. " + Tab", function()
    local ws = hl.get_active_workspace()
    if not ws then return end
    local target = ws.id + 1
    if target > 10 then target = 1 end
    hl.dispatch(hl.dsp.focus({ workspace = target }))
end)

hl.bind(mainMod .. " + SHIFT + Tab", function()
    local ws = hl.get_active_workspace()
    if not ws then return end
    local target = ws.id + 1
    if target > 10 then target = 1 end
    hl.dispatch(hl.dsp.window.move({ workspace = target }))
end)

hl.bind(mainMod .. " + mouse_down", function()
    local ws = hl.get_active_workspace()
    if not ws then return end
    local target = ws.id + 1
    if target > 10 then target = 1 end
    hl.dispatch(hl.dsp.focus({ workspace = target }))
end)

hl.bind(mainMod .. " + mouse_up", function()
    local ws = hl.get_active_workspace()
    if not ws then return end
    local target = ws.id - 1
    if target < 1 then target = 10 end
    hl.dispatch(hl.dsp.focus({ workspace = target }))
end)

-- Scratchpad (Special Workspace)
hl.bind(mainMod .. " + M",             hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(mainMod .. " + SHIFT + M",     hl.dsp.workspace.toggle_special("magic"))


---------------------
--- MOUSE DRAGGING --
---------------------

hl.bind(mainMod .. " + mouse:272",     hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",     hl.dsp.window.resize(), { mouse = true })


---------------------
--- MULTIMEDIA KEYS -
---------------------

-- Volume & Brightness
hl.bind("XF86AudioRaiseVolume",        hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",        hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --dec"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",               hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",            hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --toggle-mic"), { locked = true, repeating = true })

hl.bind("XF86MonBrightnessUp",         hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/brightness.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",       hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/brightness.sh --dec"), { locked = true, repeating = true })

-- Modifier + Volume controls (Mic adjustments)
hl.bind(mainMod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --mic-inc"), { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --mic-dec"), { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86AudioMute",        hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/vol.sh --toggle-mic"), { locked = true })

-- Media Control (Playerctl)
hl.bind("XF86AudioNext",               hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause",              hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",               hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",               hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


---------------------
---- UTILITIES ------
---------------------

-- Screenshots & Satty (Region with freeze)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | satty --filename - --output-filename /home/arefin/Pictures/Screenshots/Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png --early-exit --actions-on-enter save-to-clipboard --copy-command 'wl-copy']]))

-- Screenshots & Satty (Active Window)
hl.bind("CTRL + SHIFT + S", hl.dsp.exec_cmd([[grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | satty --filename - --output-filename /home/arefin/Pictures/Screenshots/Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png --early-exit --actions-on-enter save-to-clipboard --copy-command 'wl-copy']]))

-- Screenshots & Satty (Full Screen)
hl.bind("CTRL + SHIFT + F", hl.dsp.exec_cmd([[grim - | satty --filename - --output-filename /home/arefin/Pictures/Screenshots/Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png --early-exit --actions-on-enter save-to-clipboard --copy-command 'wl-copy']]))

-- Emoji Picker
hl.bind("SUPER + x",                   hl.dsp.exec_cmd("~/.config/hypr/scripts/emoji.sh"))

-- Wallpaper Picker (Rofi)
hl.bind(mainMod .. " + W",             hl.dsp.exec_cmd('rofi -show wallpaper -modi "wallpaper:' .. os.getenv("HOME") .. '/.config/hypr/scripts/paper.sh" -theme-str "mainbox { children: [ \\"inputbar\\", \\"listview\\" ]; } listview { columns: 2; lines: 3; spacing: 12px; } element-text { enabled: false; } element-icon { size: 144px; horizontal-align: 0.5; } element { orientation: vertical; padding: 7px; }"'))

-- Clipboard Manager (clip.sh)
hl.bind(mainMod .. " + V",             hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/clip.sh paste"))
hl.bind(mainMod .. " + SHIFT + V",     hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/clip.sh wipe"))
hl.bind("ALT + Delete",                hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/clip.sh delete"))


-- Text Reco
-- OCR Text Recognition Shortcut
hl.bind("CTRL + SHIFT + X", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | tesseract stdin stdout | wl-copy && notify-send "OCR" "Text copied to clipboard"]]))





hl.bind(mainMod .. " + O", hl.dsp.dpms({ action = "toggle" }))









