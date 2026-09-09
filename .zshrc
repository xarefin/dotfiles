build_prompt() {
  local current_dir="${PWD##*/}"
  
  # Automatically extracts the accent/primary color from your active Kitty theme file
  local kitty_color=$(grep -m 1 '^color6' ~/.config/kitty/colors.conf 2>/dev/null | awk '{print $2}')
  
  # Fallback to cyan if the file isn't found
  local arrow_color="${kitty_color:-cyan}"
  
  if [[ "$PWD" == "$HOME" ]]; then
    PROMPT="%F{${arrow_color}}❯%f "
  else
    PROMPT="%F{cyan}${current_dir}%f %F{${arrow_color}}❯%f "
  fi
}
precmd_functions+=(build_prompt)

alias prime="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"

alias ls='eza -a --icons=always'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'



# Created by `pipx` on 2026-08-26 06:01:34
export PATH="$PATH:/home/arefin/.local/bin"

alias knc="killall swaync && swaync &"


source /home/arefin/.config/broot/launcher/bash/br
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export PATH=$PATH:/home/arefin/.spicetify

export EDITOR=nvim
