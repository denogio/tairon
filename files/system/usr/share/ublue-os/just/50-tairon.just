alias tairon := tairon-menu

# Tairon system scripts - Essential utilities for Tairon
# All scripts are installed to ~/.local/bin on first boot via tairon-install-scripts

# Show all available Tairon commands
list:
    #!/usr/bin/env bash
    echo "Tairon System Scripts"
    echo "====================="
    echo ""
    echo "Menu & Navigation:"
    echo "  tairon-menu              - Main menu system"
    echo ""
    echo "Window Management:"
    echo "  tairon-hyprland-window-close-all  - Close all windows"
    echo "  tairon-hyprland-window-pop         - Pop window to top"
    echo ""
    echo "Theme & Appearance:"
    echo "  tairon-theme-set-browser     - Set browser theme"
    echo "  tairon-show-logo            - Show Tairon logo"
    echo ""
    echo "System & Utilities:"
    echo "  tairon-battery-monitor     - Battery monitor"
    echo "  tairon-battery-remaining    - Battery remaining"
    echo "  tairon-audio-switch        - Audio output switch"
    echo "  tairon-screenshot          - Take screenshots"
    echo "  tairon-pkg-remove         - Remove packages"
    echo "  tairon-pkg-present         - Check package presence"
    echo ""
    echo "Update & Maintenance:"
    echo "  tairon-update-scripts      - Update all Tairon scripts"
    echo "  tairon-install-scripts     - Install Tairon scripts"
    echo ""

# Update Tairon scripts from system
update-scripts:
    tairon-update-scripts
