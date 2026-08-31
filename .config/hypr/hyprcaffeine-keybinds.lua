-- HyprCaffeine Keybinds (v0.9.2) ──────────────────────────────────────────
-- SUPER + CTRL + I       → Toggle infinite idle (on/off)
-- SUPER + CTRL + SHIFT + I → Show Walker menu
-- SUPER + CTRL + SHIFT + D → Toggle lid inhibit
-- SUPER + CTRL + D       → Toggle monitor keep-awake

hl.bind("SUPER + CTRL + I",         hl.dsp.exec_cmd("/usr/bin/hyprcaffeine toggle"))
hl.bind("SUPER + CTRL + SHIFT + I", hl.dsp.exec_cmd("/usr/bin/hyprcaffeine menu"))
hl.bind("SUPER + CTRL + SHIFT + D", hl.dsp.exec_cmd("/usr/bin/hyprcaffeine lid toggle"))
hl.bind("SUPER + CTRL + D",         hl.dsp.exec_cmd("/usr/bin/hyprcaffeine monitor toggle"))
