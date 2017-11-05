# Intellij Pywal Scheme Generator
The scripts in this repository can generate Intellij themes based on
[Pywal](https://github.com/dylanaraps/pywal) or other color scheme generator tools automatically. It is meant to
be used in combination with [Material Theme Plugin](https://plugins.jetbrains.com/plugin/8006-material-theme-ui) to integrate with every
element of Intellij's UI instead of just the editor's color scheme.

## Dependencies
- Intellij (or some other Jetbrains IDE) + Material Theme Plugin
- Pywal

## Instalation

    **Warning**: this script overrides `material_custom_theme.xml` so make sure to backup your custom material theme configuration if you care for it.

1. Clone or download the files on this repository
2. Modify `intellijPywalGen.sh` so that `$ijCfPath` points to your [config
directory](https://intellij-support.jetbrains.com/hc/en-us/articles/206544519-Directories-used-by-the-IDE-to-store-settings-caches-plugins-and-logs)/colors
(eg.: `~/.IntelliJIdea2017.2/config/colors/material_pywal.icls`) and
`$ijCfPath` to point to your `config/options` directory (eg.: `~/.IntelliJIdea2017.2/config/options/material_custom_theme.xml`)
3. Run `intellijPywalGen.sh`
4. Set material theme to "custom theme" `(Intellij -> Tools -> Material Theme ->
   Material Theme Chooser -> Custom Theme)`
5. Import `material-pywal.icls` editor scheme which should be located wherever
   `$ijCfPath` points to via `(Intellij -> File -> Settings -> Editor
   -> Color Scheme -> Scheme : -> Import Scheme...)`
6. Set the editor's color scheme `(Intellij -> File -> Settings -> Editor
   -> Color Scheme -> Scheme: Material Pywal)`
7. Restart Intellij

After the first time you'll only need to restart Intellij after you run the script in order for changes to
take effect.

## i3wm Integration
Integration with `i3` is very simple. A good way to go about it is to bind
a shortcut to change the wallpaper using wal and call this script on the same
command. For example:

    bindsym $mod+Print exec "wal -i $HOME/Pictures/Wallpapers; /pathToScript/intellijPywalGen.sh"


## Screenshots
![demo](screenshots/sample.gif)
