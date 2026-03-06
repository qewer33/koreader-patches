# qewer33's KOReader Patches

My custom user patches for [KOReader](https://github.com/koreader/koreader). These patches together make the default file browser view of KOReader more modern while allowing you to see more info and have quick access to things you use often. They can also be used independantly of each other.

Here's how they look on my Kobo Libra Colour!

![photo](./assets/photo.jpeg)

# Installation

Drop the `.lua` files into your `koreader/patches/` directory. Place all the icons in the `icons/` folder in your KOReader `icons/` directory.

## Patches

### 2-custom-titlebar.lua

Replaces the default "KOReader" title with a custom status bar showing device info.

**Left side:** Device name (configurable, defaults to device model)

**Center:** Time display (HH:MM, optional)

**Right side:** Status indicators (configurable):
- WiFi signal strength (blue when connected, red when disconnected)
- Disk usage
- RAM usage
- Frontlight level
- Battery percentage (green/yellow/red based on level)

**Features:**
- Settings menu under **File Browser > Titlebar settings**
- Configurable device name, separator style (dot, bar, dash, bullet, space, custom)
- **Items** submenu: toggle individual indicators, drag to reorder
- Optional bottom border line
- Optional colored status icons (icon characters colored, labels stay black)
- Home/plus buttons moved inline with the subtitle (path) row
- Works in both portrait and landscape orientation

### 2-custom-navbar.lua

Adds a tab bar at the bottom of the File Manager with configurable tabs:

| Tab | Action | Default |
|---|---|---|
| **Books** | Refreshes the file browser | On |
| **Manga** | Opens [Rakuyomi](https://github.com/tachibana-shin/rakuyomi) | On |
| **News** | Opens [QuickRSS](https://github.com/qewer33/QuickRSS) | On |
| **Continue** | Reopens the last read document | On |
| **History** | Opens reading history | Off |
| **Favorites** | Opens favorites collection | Off |
| **Collections** | Opens collections list | Off |

The active tab is highlighted with a bold label and underline (technically only the Books tab is ever highlighted since the bar isn't visible on other views). Tabs for uninstalled plugins show an info message when tapped.

**Features:**
- Settings menu under **File Browser > Navbar settings**
- **Tabs** submenu: toggle individual tabs, drag to reorder
- Optional top border line
- Optional colored active tab (icon, label, and underline in configurable color, blue by default)
- Refresh navbar button to apply changes without restarting

**Custom icons required:** Place all the icons in the `icons/` folder in your KOReader `icons/` directory.

### 2-hide-pagination.lua

Removes the pagination bar (`« < Page 1 of 2 > »`) from the file browser. The mosaic/list grid stretches to fill the reclaimed space. Swipe gestures for page navigation still work.

## Deploy Script

`deploy_patch.sh` copies all `.lua` files to the local KOReader patches directory and restarts KOReader, useful for development.

```sh
./deploy_patch.sh
```
