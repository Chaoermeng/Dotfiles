if test (uname -s) = Darwin
    find $HOME/Dotfiles -name ".DS_Store" -type f -delete
    rm -f $HOME/.zshrc
    rm -f $HOME/.zprofile
    rm -f $HOME/.zshenv
    stow -R zsh
    stow -R zsh@x86
end

if test (uname -s) = Linux
    rm -rf $HOME/.config/mihomo
    stow -R mihomo

    rm -rf /etc/nginx
    stow -R nginx -t /

    rm -rf /etc/samba
    stow -R samba -t /

    stow -R quadlet@system -t /
    stow -R quadlet@user
    stow -R systemd@system -t /
    stow -R systemd@user
end

rm -rf $HOME/.config/bat
stow -R bat

rm -rf $HOME/.config/brew
stow -R homebrew

rm -rf $HOME/.config/bun
rm -rf $XDG_DATA_HOME/bun
stow -R bun

rm -rf $HOME/.codex
stow -R codex

rm -rf $HOME/.config/fish
stow -R fish

rm -rf $HOME/.config/git
stow -R git

rm -rf $HOME/.config/htop
stow -R htop

rm -rf $HOME/.config/nvim
stow -R nvim

rm -rf $HOME/.config/posting
stow -R posting

rm -rf $HOME/.ssh
stow -R ssh

rm -rf $HOME/.config/tailscale
stow -R tailscale

rm -rf $HOME/.config/whalebrew
stow -R whalebrew
