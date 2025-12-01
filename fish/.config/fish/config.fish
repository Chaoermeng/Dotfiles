if test (uname -s) = Darwin
    # Homebrew
    /opt/homebrew/bin/brew shellenv | source
    /opt/homebrew/bin/whalebrew completion fish | source

    # Orbstack
    source ~/.orbstack/shell/init2.fish 2>/dev/null || :

    # SSH-Agent
    abbr keychain-add "/usr/bin/ssh-add --apple-use-keychain"

    # Abbreviation
    abbr x86 "arch -arm64 env ZDOTDIR='$HOME/.zsh@x86' zsh"
    abbr xcode "open -a Xcode"

    # Adapt Dynamic Terminal Theme
    if test "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" = Dark
        osascript -e 'tell application "Terminal"
            set current settings of tabs of windows to settings set "Transparent Dark" -- Theme name
        end tell'
    else
        osascript -e 'tell application "Terminal"
            set current settings of tabs of windows to settings set "Transparent Light" -- Theme name
        end tell'
    end
end

if test (uname -s) = Linux
    # Linuxbrew
    /home/linuxbrew/.linuxbrew/bin/brew shellenv fish | source

    # SSH-Agent
    eval "$(ssh-agent -c 2>/dev/null)" >/dev/null

    # Abbreviation
    abbr psg /usr/lib/systemd/system-generators/podman-system-generator
    abbr sc systemctl
    abbr scu "systemctl --user"
    # alias tailscale "tailscale --socket $XDG_RUNTIME_DIR/tailscale/tailscaled.sock"
end

if status is-interactive
    function fish_greeting
        #        fastfetch
    end
end

# Abbreviation
abbr apy "source ./.venv/bin/activate.fish"
abbr activate "source .venv/bin/activate.fish"
abbr dpy deactivate
abbr f fastfetch
abbr ipy "uv init --no-readme"
abbr jnote "jupyter notebook"
abbr jlab "jupyter lab"
abbr n nvim
abbr s source
abbr td "tailscale down"
abbr tp "tailscale ping"
abbr ts "tailscale status"
abbr tu "tailscale up"

# Functions
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
