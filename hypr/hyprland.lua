-- ============================================================
-- MIDNIGHT WOLF — Hyprland 0.55+
-- SILENT • FOCUSED • UNSTOPPABLE
-- ============================================================

-- -------------------------
-- Programs
-- -------------------------
local terminal   = "kitty"
local launcher   = "rofi -show drun -theme ~/.config/rofi/midnight-wolf.rasi"
local fileManager = "thunar"
local browser    = "firefox"

local configDir = os.getenv("HOME") .. "/.config"
local scripts   = configDir .. "/hypr/scripts"

-- -------------------------
-- Monitor
-- -------------------------
-- "preferred" keeps this portable between machines.
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

-- -------------------------
-- Environment
-- -------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- -------------------------
-- General
-- -------------------------
hl.config({
    general = {
        gaps_in = 7,
        gaps_out = 12,
        border_size = 2,
         ["col.active_border"] = "rgb(3382F6) rgb(94A3B8) 45deg",
         ["col.inactive_border"] = "rgba(94A3B833)",
        resize_on_border = true,
        allow_tearing = false,
    },
})

-- -------------------------
-- Decoration
-- -------------------------
hl.config({
    decoration = {
        rounding = 14,

        active_opacity = 0.96,
        inactive_opacity = 0.88,

        shadow = {
            enabled = true,
            range = 18,
            render_power = 3,
            color = "rgba(00000099)",
        },

        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
        },
    },
})

-- -------------------------
-- Animations
-- -------------------------
hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("midnight", {
    type = "bezier",
    points = {
        { 0.16, 1.0 },
        { 0.3, 1.0 },
    },
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 8,
    curve = "midnight",
    style = "popin 85%",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 7,
    curve = "midnight",
    style = "popin 85%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 6,
    curve = "midnight",
    style = "popin 85%",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 7,
    curve = "midnight",
    style = "slidefade 15%",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 7,
    curve = "midnight",
    style = "slidefade",
})

-- -------------------------
-- Layout
-- -------------------------
hl.config({
    dwindle = {
        pseudotile = true,
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
    },

    master = {
        new_status = "master",
        mfact = 0.55,
    },

    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
        disable_splash_rendering = true,
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- -------------------------
-- Autostart
-- -------------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("nm-applet --indicator")
end)

-- -------------------------
-- Layer rules
-- -------------------------
hl.layer_rule({
    name = "midnight-waybar",
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0.25,
})

hl.layer_rule({
    name = "midnight-rofi",
    match = { namespace = "rofi" },
    blur = true,
    ignore_alpha = 0.25,
})

-- -------------------------
-- Window rules
-- -------------------------
hl.window_rule({
    name = "midnight-terminal",
    match = { class = "kitty" },
    opacity = "0.92 override 0.82 override",
})

hl.window_rule({
    name = "midnight-floating-dialogs",
    match = { float = true },
    opacity = "0.94 override 0.88 override",
})

-- Keep fullscreen applications clean.
hl.window_rule({
    name = "midnight-fullscreen",
    match = { fullscreen = true },
    rounding = 0,
    border_size = 0,
})

-- -------------------------
-- Keybindings
-- -------------------------
local MOD = "SUPER"

hl.bind(MOD .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(MOD .. " + R", hl.dsp.exec_cmd(launcher))
hl.bind(MOD .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(MOD .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(MOD .. " + Q", hl.dsp.window.close())
hl.bind(MOD .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MOD .. " + F", hl.dsp.window.fullscreen())
hl.bind(MOD .. " + P", hl.dsp.window.pseudo())
hl.bind(MOD .. " + J", hl.dsp.layout("togglesplit"))

-- Lock screen, only if hyprlock exists.
hl.bind(MOD .. " + L", hl.dsp.exec_cmd(
    "command -v hyprlock >/dev/null 2>&1 && hyprlock"
))

-- Reload Waybar.
hl.bind(MOD .. " + SHIFT + R", hl.dsp.exec_cmd(
    scripts .. "/reload-waybar.sh"
))

-- Change wallpaper.
hl.bind(MOD .. " + SHIFT + W", hl.dsp.exec_cmd(
    scripts .. "/wallpaper-next.sh"
))

-- Focus.
hl.bind(MOD .. " + LEFT",  hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + UP",    hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + DOWN",  hl.dsp.focus({ direction = "down" }))

-- Move windows.
hl.bind(MOD .. " + SHIFT + LEFT",  hl.dsp.window.move({ direction = "left" }))
hl.bind(MOD .. " + SHIFT + RIGHT", hl.dsp.window.move({ direction = "right" }))
hl.bind(MOD .. " + SHIFT + UP",    hl.dsp.window.move({ direction = "up" }))
hl.bind(MOD .. " + SHIFT + DOWN",  hl.dsp.window.move({ direction = "down" }))

-- Workspaces.
for i = 1, 9 do
    hl.bind(
        MOD .. " + " .. i,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        MOD .. " + SHIFT + " .. i,
        hl.dsp.window.move({ workspace = i })
    )
end

hl.bind(MOD .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(MOD .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Special workspace.
hl.bind(MOD .. " + S", hl.dsp.workspace.toggle_special("wolf"))

-- Mouse.
hl.bind(
    MOD .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    MOD .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- -------------------------
-- Media / brightness
-- -------------------------
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
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true }
)
