#!/usr/bin/python

# This script requires i3ipc-python package (install it from a system package manager
# or pip).
# It adds icons to the workspace name for each open window.
# Set your keybindings like this: set $workspace1 workspace number 1
# Add your icons to WINDOW_ICONS.
# Based on https://github.com/maximbaz/dotfiles/blob/master/bin/i3-autoname-workspaces

import argparse
import i3ipc
import logging
import re
import signal
import sys

WINDOW_ICONS = {
    "firefox": "",
    "foot": "",
    "alacritty": "",
    "discord": "",
    "steam": "",
    "spotify": "",
    "telegramdesktop": "",
    "bitwarden": "",
    "code-oss": "",
    "onedrive_tray": "",
    "myxer": "",
    "pavucontrol": "",
    "blueman-manager": "",
    "blueberry.py": "",
    "thunar": "",
    "io.github.quodlibet.quodlibet": "",
    "org.qbittorrent.qbittorrent": "",
}

DEFAULT_ICON = ""


def icon_for_window(window):
    app_id = window.app_id
    if app_id is not None and len(app_id) > 0:
        app_id = app_id.lower()
        if app_id in WINDOW_ICONS:
            return WINDOW_ICONS[app_id]
        logging.info("No icon available for window with app_id: %s" % str(app_id))
    else:
        # xwayland support
        class_name = window.window_class
        if len(class_name) > 0:
            class_name = class_name.lower()
            if class_name in WINDOW_ICONS:
                return WINDOW_ICONS[class_name]
            logging.info(
                "No icon available for window with class_name: %s" % str(class_name)
            )
    return DEFAULT_ICON


def rename_workspaces(ipc):
    for workspace in ipc.get_tree().workspaces():
        name_parts = parse_workspace_name(workspace.name)
        icon_tuple = ()
        focused_name = ""
        for w in workspace:
            if w.app_id is not None or w.window_class is not None:
                icon = icon_for_window(w)
                if not ARGUMENTS.duplicates and icon in icon_tuple:
                    continue
                icon_tuple += (icon,)
                
            focus_idle=workspace.find_by_id(workspace.focus[0])
            if focus_idle:
                while len(focus_idle.focus) > 0:
                    focus_idle = workspace.find_by_id(focus_idle.focus[0])
                focused_name = (focus_idle.name[:15] + '..') if focus_idle.name and len(focus_idle.name) > 15 else focus_idle.name
                    
        name_parts["icons"] = " ".join(icon_tuple) + " "
        name_parts["title"] = focused_name
        new_name = construct_workspace_name(name_parts)
        ipc.command('rename workspace "%s" to "%s"' % (workspace.name, new_name))


def undo_window_renaming(ipc):
    for workspace in ipc.get_tree().workspaces():
        name_parts = parse_workspace_name(workspace.name)
        name_parts["icons"] = None
        name_parts["title"] = None
        new_name = construct_workspace_name(name_parts)
        ipc.command('rename workspace "%s" to "%s"' % (workspace.name, new_name))
    ipc.main_quit()
    sys.exit(0)


def parse_workspace_name(name):
    return re.match(
        "(?P<num>[0-9]+):?(?P<shortname>\w+)? ?(?P<icons>.+)?", name
    ).groupdict()


def construct_workspace_name(parts):
    new_name = str(parts["num"])
    if (parts["title"] and len(parts["title"]) > 0) or (parts["icons"] and len(parts["icons"]) > 1):
        new_name += ":"

        if parts["shortname"]:
            new_name += parts["shortname"]

        if parts["icons"] and len(parts["icons"]) > 1:
            new_name += " " + parts["icons"]

        if parts["title"] and len(parts["title"]) > 0:
            new_name += parts["title"]
    return new_name


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="This script automatically changes the workspace name in sway depending on your open applications."
    )
    parser.add_argument(
        "--duplicates",
        "-d",
        action="store_true",
        help="Set it when you want an icon for each instance of the same application per workspace.",
    )
    parser.add_argument(
        "--logfile",
        "-l",
        type=str,
        default="/tmp/sway-autoname-workspaces.log",
        help="Path for the logfile.",
    )
    parser.add_argument(
        "--stdout",
        "-L",
        action="store_true",
        help="Output log to stdout",
    )
    args = parser.parse_args()
    global ARGUMENTS
    ARGUMENTS = args

    if not args.stdout:
        logging.basicConfig(
            level=logging.INFO,
            filename=ARGUMENTS.logfile,
            filemode="w",
            format="%(message)s",
        )
    else:
        logging.basicConfig(
            level=logging.INFO,
            format="%(message)s",
        )

    ipc = i3ipc.Connection()

    for sig in [signal.SIGINT, signal.SIGTERM]:
        signal.signal(sig, lambda signal, frame: undo_window_renaming(ipc))

    def window_event_handler(ipc, e):
        if e.change in ["new", "close", "move", "focus", "title"]:
            rename_workspaces(ipc)

    ipc.on("window", window_event_handler)

    rename_workspaces(ipc)

    ipc.main()
