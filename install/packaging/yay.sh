# Install all yay packages
mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/omarchy-yay.packages" | grep -v '^$')

if [ ${#packages[@]} -gt 0 ]; then
  yay -S --noconfirm --needed "${packages[@]}"
fi
