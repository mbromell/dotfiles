# This can non-declaratively install packages on your system.
# You can run this using `nix-env -if filename.nix`
{
  stable ? import <stable> {},
  unstable ? import <unstable> {}
}: {
  inherit (stable)
    bat
    curl
    eza
    fd
    fzf
    git
    gnumake
    jq
    python3
    ripgrep
    tmux
    unzip
    zsh
    ;

  inherit (unstable)
    bun
    go
    neovim
    starship
    stow
    stylua
    wezterm
    zoxide
    ;
}
