if test (uname -s) = Darwin
    # Homebrew
    /opt/homebrew/bin/brew shellenv | source

    # Orbstack
    source ~/.orbstack/shell/init2.fish 2>/dev/null || :

    # SSH-Agent
    abbr keychain-add "/usr/bin/ssh-add --apple-use-keychain"

    # Abbreviation
    abbr x86 "arch -arm64 env ZDOTDIR=$HOME/.zsh@x86 zsh"
    abbr xcode "open -a Xcode"
end

if test (uname -s) = Linux
    # Linuxbrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

    # SSH_Agent
    eval "$(ssh-agent -c 2>/dev/null)" >/dev/null

    # Abbreviation
    abbr psg /usr/lib/systemd/system-generators/podman-system-generator
    abbr sc systemctl
    abbr scu "systemctl --user"
    alias tailscale "tailscale --socket $XDG_RUNTIME_DIR/tailscale/tailscaled.sock"
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
abbr ipy "uv init --no-readme"
abbr jnote "jupyter notebook"
abbr jlab "jupyter lab"
abbr s source
abbr td "tailscale down"
abbr tp "tailscale ping"
abbr ts "tailscale status"
abbr tu "tailscale up"
