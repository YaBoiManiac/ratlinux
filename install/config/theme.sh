# Set links for Nautilius action icons
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-previous-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-previous-symbolic.svg
sudo ln -snf /usr/share/icons/Adwaita/symbolic/actions/go-next-symbolic.svg /usr/share/icons/Yaru/scalable/actions/go-next-symbolic.svg

# Setup theme links
mkdir -p ~/.config/omarchy/themes
for f in ~/.local/share/omarchy/themes/*; do ln -nfs "$f" ~/.config/omarchy/themes/; done

# Set initial theme
mkdir -p ~/.config/omarchy/current
ln -snf ~/.config/omarchy/themes/hackerman ~/.config/omarchy/current/theme

# Create wallpapers directory and set default wallpaper
mkdir -p ~/.config/hypr/wallpapers
# Link to first available wallpaper in the directory, or create a placeholder
if ls ~/.config/hypr/wallpapers/*.{png,jpg,jpeg} 1> /dev/null 2>&1; then
  ln -snf "$(find ~/.config/hypr/wallpapers -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | sort | head -n 1)" ~/.config/omarchy/current/background
else
  touch ~/.config/hypr/wallpapers/.placeholder
fi

# Set specific app links for current theme
# ~/.config/omarchy/current/theme/neovim.lua -> ~/.config/nvim/lua/plugins/theme.lua is handled via omarchy-setup-nvim

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omarchy/current/theme/btop.theme ~/.config/btop/themes/current.theme

mkdir -p ~/.config/mako
ln -snf ~/.config/omarchy/current/theme/mako.ini ~/.config/mako/config

# Add managed policy directories for Chromium and Brave for theme changes
sudo mkdir -p /etc/chromium/policies/managed
sudo chmod a+rw /etc/chromium/policies/managed

sudo mkdir -p /etc/brave/policies/managed
sudo chmod a+rw /etc/brave/policies/managed
 