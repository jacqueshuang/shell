#!/bin/bash

# 设置日志文件
LOG_FILE="$HOME/zsh_installation_log.txt"

# 设置 GitHub SSH 密钥路径
GITHUB_SSH_KEY_PATH="$HOME/.ssh/github_rsa"
GITHUB_SSH_KEY="-----BEGIN OPENSSH PRIVATE KEY-----

-----END OPENSSH PRIVATE KEY-----"

# 创建 GitHub SSH 密钥
mkdir -p "$HOME/.ssh"
echo "$GITHUB_SSH_KEY" > "$GITHUB_SSH_KEY_PATH"
chmod 600 "$GITHUB_SSH_KEY_PATH"

# 配置 SSH 文件
SSH_CONFIG_FILE="$HOME/.ssh/config"
echo "
Host github.com
  User git
  Hostname github.com
  IdentityFile $GITHUB_SSH_KEY_PATH
  UseKeychain yes
  AddKeysToAgent yes
" > "$SSH_CONFIG_FILE"

# 安装必要的依赖
echo "Installing required software..." >> "$LOG_FILE"
sudo apt-get update >> "$LOG_FILE" 2>&1
sudo apt-get install -y zsh git curl >> "$LOG_FILE" 2>&1

# 安装插件
echo "Installing Zsh plugins..." >> "$LOG_FILE"
# 克隆插件仓库并配置
ZSH_PLUGIN_DIR="$HOME/.zsh/plugins"
mkdir -p "$ZSH_PLUGIN_DIR"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting" >> "$LOG_FILE" 2>&1
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_PLUGIN_DIR/zsh-autosuggestions" >> "$LOG_FILE" 2>&1
git clone https://github.com/zsh-users/zsh-autocomplete.git "$ZSH_PLUGIN_DIR/zsh-autocomplete" >> "$LOG_FILE" 2>&1
git clone https://github.com/romkatv/powerlevel10k.git "$ZSH_PLUGIN_DIR/powerlevel10k" >> "$LOG_FILE" 2>&1

# 配置 Zsh 插件
echo "Configuring Zsh plugins..." >> "$LOG_FILE"
echo "
# Enable plugins
source $ZSH_PLUGIN_DIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGIN_DIR/powerlevel10k/powerlevel10k.zsh-theme
" >> "$HOME/.zshrc"

# 安装 Oh-My-Zsh
echo "Installing Oh-My-Zsh..." >> "$LOG_FILE"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >> "$LOG_FILE" 2>&1

# 设置默认 shell 为 Zsh
echo "Setting Zsh as default shell..." >> "$LOG_FILE"
chsh -s $(which zsh)

# 完成
echo "Installation and configuration completed. Please restart your terminal." >> "$LOG_FILE"
