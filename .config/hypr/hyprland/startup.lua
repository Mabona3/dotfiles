-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("swaync")
    hl.exec_cmd("wallust -s run /home/mabona/wallpaper/arch/arch_sword.jpg")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

hl.config({
    ecosystem = {
        enforce_permissions = true,
    },
})

hl.permission("/usr/(bin|local/bin|sbin)/grim", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin|sbin)/slurp", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprshot", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
hl.permission("/usr/(bin|local/bin|sbin)/hyprlock", "screencopy", "allow")
