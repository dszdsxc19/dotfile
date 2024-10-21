#!/bin/bash

sudo xcode-select --install
sudo xcodebuild -license

## 配置 git
echo "请输入您的 Git 用户名："
read git_username
echo "请输入您的 Git 邮箱地址："
read git_email

git config --global user.name "$git_username"
git config --global user.email "$git_email"

echo "Git 配置已更新：用户名 - $git_username，邮箱 - $git_email"

# 尝试执行官方 Homebrew 安装脚本
if ! /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
    echo "官方 Homebrew 安装失败，尝试使用 HomebrewCN 脚本安装..."
    # 如果官方脚本失败，则执行 HomebrewCN 脚本
    /bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
else
    echo "Homebrew 安装成功完成。"
fi

# 安装 oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安装 powerlevel10k
brew install powerlevel10k
echo "source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme" >> ~/.zshrc

# 安装 zsh-autosuggestions
brew install zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

# 安装 zsh-syntax-highlighting
brew install zsh-syntax-highlighting
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ~/.zshrc

# 安装 Brewfile 中的软件
brew bundle install

# 配置 iTerm2
