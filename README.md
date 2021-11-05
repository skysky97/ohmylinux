# intro

This repo helps build the startup linux develop environment.

## tools

- editor
  - vim
    * coc.nvim
    * vim-colors-solarized
  - vscode
- terminal
  - kitty
  - dircolor-solarized
  - tmux
- bash
  - zsh
- wm/destop
  - i3wm

## vim

### build from source

#### dependence

- python
- python3

#### step

0. Clone code: `git clone https://github.com/vim/vim`

0. Build and install
```
./configure --prefix=/opt/vim-8.2
make -j16
make install
```

## coc.nvim

### dependence

- nodejs
- yarn

