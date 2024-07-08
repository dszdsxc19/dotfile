# MacOS Development Setup

In order to config once, code anywhere, I need to make some customized configuration in my MacOS Air M1 chip. i do not have so many time, so lazy-xxx series is good choice for me.
## `Homebrew`

`Homebrew` is necessary and high-priority for developer. We can use `homebrew` to install command-line tools or apps by casks.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

If you meet 443 block, try below mirror command:
```sh
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
```
### Use Homebrew to Install Xcode Command Line Tools

If you haven't already installed Xcode Command Line Tools, you'll see a message that "The Xcode Command Line Tools will be installed." Press return to continue when prompted by the Homebrew installation script.
### how to use

For example, we can type `brew install git` to install git in one line. That's very efficiently.

`Homebrew` can also manage graphical user interface (GUI) apps, fonts, and plug-ins on macOS. If you want to install  `brew install --cask visual-studio-code`. This two command can cover 90 percent of use case. For more information, please refer to [Homebrew Documentation](https://docs.brew.sh/Manpage).

The other significant advantages of `homebrew` is that it can manage dependency and version so we can upgrade or uninstall software in seconds.
### brew bundle

In python, there are files like `requirements.txt` to manage pip dependencies and you can implement one-click installation with the help of this technology.

Homebrew provide similar mechanism.

```sh
# export
brew bundle dump
# install, it will search for Brewfile in current dir
brew bundle install
```

### oh-my-zsh

MacOS use zsh as default shell. 

> Oh My Zsh is a delightful, open source, community-driven framework for managing your Zsh configuration.

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### theme
There are many nice themes. My choice is[Powerlevel10k](https://github.com/romkatv/powerlevel10k).

Installation:
```sh
brew install powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
```

And then when you open a new terminal, it will automatically guide you to configure.
#### plugins

As long as it can be managed by brew, use brew to manage it to reduce costs.
##### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

1. brew install

```sh
brew install zsh-autosuggestions
```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
``` sh
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```
3. Start a new terminal session.
##### [zsh-syntax-highlightin](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

Similar with `zsh-autosuggestions`, 
```sh
brew install zsh-syntax-highlighting
```

and then add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc)
``` sh
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
```
3. Start a new terminal session.
## [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

Nerd Fonts is a project that uses a large number of font icons to solve the problem of programmers lacking suitable fonts during the development process.

```sh
# add source
brew tap homebrew/cask-fonts
# search available fonts
brew search nerd-font
# install your preference
brew install font-jetbrains-mono-nerd-font
```

## Git and Github

It can be said that git and github are the passports to the programmer world. In order to successfully upload code and sign, we need the following configuration.
### ssh-key

[Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and then [Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
### GPG

We can use GPG to sign our commit. Tutorial: [Set up a GPG key for signing Git commits on MacOS (M1)](https://gist.github.com/phortuin/cf24b1cca3258720c71ad42977e1ba57)

## IDE

### GUI
[VS Code](https://code.visualstudio.com) is open source and powerful. Installation is simple in Homebrew as I've introduced as follow: `brew install --cask visual-studio-code`.

You can even use `Homebrew` to install `vscode` extensions.
### Terminal

When I was young, I spent lot of time studying configuring [vim](https://github.com/vim/vim) and dreaming I was a geek who can type the world. Even though I finally give in, the passion remained and adapting to changes in time just like the relationship between [Neovim](https://github.com/neovim/neovim) and vim.

Neovim is also cumbersome to config. There are serval neovim setup: [NvChad](https://github.com/NvChad/NvChad) or [LazyVim](https://github.com/LazyVim/LazyVim) or [Lunarvim](https://github.com/LunarVim/LunarVim). We can use them to make neovim out of the box.

#### Install NeoVim

```sh
brew install newvim
```

#### setup lazyVim

```sh
git clone https://github.com/LazyVim/starter ~/.config/nvim
nvim
```

#### [Neovide](https://github.com/neovide/neovide)
This is a simple graphical user interface for Neovim (an aggressively refactored and updated Vim editor). Where possible there are some graphical improvements, but functionally it should act like the terminal UI.

## [tmux](https://github.com/tmux/tmux)

> tmux is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached.

tmux is very useful when you need to connect to remote or you want to keep your content when you reconnect. You can refer to [Tmux 使用教程](https://www.ruanyifeng.com/blog/2019/10/tmux.html) to learn how to use.

#### auto tmux resurrecting 

There are many tools to persistent:  [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect),[tmux-continuum](https://github.com/tmux-plugins/tmux-continuum), [tmuxp](https://github.com/tmux-python/tmuxp) and [tmuxinator](https://github.com/tmuxinator/tmuxinator).

I do not need to complex function, so [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) plus [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) is good for me. It's managed by [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

set as below in `~/.tmux.conf`:
```conf
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

set -g @continuum-save-interval '15'

# Option to display current status of tmux continuum in tmux status line. 
set -g status-right 'Continuum status: #{continuum_status}'
```
## dotfiles

Many software custom configurations are written in dotfiles, so in order to achieve the goal of write once, run anywhere, **we should also back up this part**.

There are some popular dotfiles collections like [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles) or [thoughtbot dotfiles](https://github.com/thoughtbot/dotfiles).

## Web Develop
###  [nvm](https://github.com/nvm-sh/nvm)
nvm allows you to quickly install and use different versions of node via the command line.

#### installation

```sh
brew install nvm
echo "source $(brew --prefix nvm)/nvm.sh" >> ~/.zshrc
```

#### useful nvm command line
```sh
// check version
node -v || node --version

// list locally installed versions of node
nvm ls

// list remove available versions of node
nvm ls-remote

// install specific version of node
nvm install 18.16.1

// set default version of node
nvm alias default 18.16.1

// switch version of node
nvm use 20.5.1

// install latest LTS version of node (Long Term Support)
nvm install --lts

// install latest stable version of node
nvm install stable
```

### Angular

```sh
npm install -g @angular/cli
```

#### React
```sh
npx create-next-app@latest
```

### Java

```sh
brew install openjdk@17
echo 'export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"' >> ~/.zshrc
```
## Other tools
#### [Neofetch](https://github.com/dylanaraps/neofetch)

installation:
```sh
brew install neofetch
```
Run on Startup:
Add `neofetch` to the end of `~/.zshrc`.
### [lazygit](https://github.com/jesseduffield/lazygit)
Lazygit is a simple terminal UI for git commands.

installations:
```sh
brew install jesseduffield/lazygit/lazygit
```
tutorial: [15 Lazygit Features in 15 Minutes](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#tutorials)

### [SwitchHosts](https://github.com/oldj/SwitchHosts)

SwitchHosts is an App for managing hosts file.

```
199.232.68.133 raw.githubusercontent.com
199.232.68.133 user-images.githubusercontent.com
199.232.68.133 avatars2.githubusercontent.com
199.232.68.133 avatars1.githubusercontent.com
```

### [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode)
A better and friendly vi(vim) mode plugin for ZSH.

Installation:
```sh
brew install zsh-vi-mode
```

and then:
```
echo "source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc 
```
# References
