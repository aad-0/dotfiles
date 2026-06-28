# #!/bin/bash
# pkill -STOP picom        # Pause picom to prevent blur
# sleep 0.1                # Optional: give time to freeze
# maim "$@"                # Take screenshot with arguments passed
# pkill -CONT picom        # Resume picom

#!/bin/bash
pkill -STOP picom
sleep 0.1

maim "$@" | xclip -selection clipboard -t image/png

pkill -CONT picom
