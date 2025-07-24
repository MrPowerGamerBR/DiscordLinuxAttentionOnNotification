<h1 align="center">🔔 DiscordLinuxAttentionOnNotification 🔔</h1>

On Windows, I enjoy keeping Discord's notification popups and sound effects disabled to avoid distractions, but I do like having the attentative status (orange highlight) on the taskbar to remind me that I do have unread messages.

However, the attentative status is not implemented on Discord's Linux client, which is sad...

But we can implement it ourselves!

* `kdotool` has a function to set the attentative status on any window that we want
* `dbus-monitor` can monitor all sent notifications by any app

By mixing the two, we can filter Discord notifications with `dbus-monitor` and, when a Discord notification is detected, we can search all windows that have the `discord` class and apply the attentative status for each of them!

Discord's notifications MUST be enabled in the client for this script to work. To hide the notifications, disable them in KDE Plasma's notification settings.

## Dependencies

* KDE Plasma (Wayland)
* `dbus`
* `kdotool`

## Discord Canary Support

Because the Discord Canary deb package uses the `discord-canary.desktop` file name, KDE Plasma gets confused and doesn't know how to associate the notifications and unread notification badges (if you have `libunity`) to the desktop icon, so you aren't able to disable notifications from the KDE Plasma Notifications panel.

To fix this, you need to rename the `discord-canary.desktop` to `discord.desktop`. You also need to do this if you are using the Discord Canary AUR package, because it also has the same issue.