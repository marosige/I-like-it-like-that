# When I use Kitty, I disable the onedark fish theme, cause it overwrites the onedark Kitty theme.
set onedark false

if status is-interactive
  if $onedark
      # Set OneDark Color Scheme
      set -l onedark_options '-b'

      if set -q VIM
          # Using from vim/neovim.
          set onedark_options "-256"
      else if string match -iq "eterm*" $TERM
          # Using from emacs.
          function fish_title; true; end
          set onedark_options "-256"
      end

      set_onedark $onedark_options
  end
end

# Configure fuck alias
thefuck --alias | source

# Add my bin folder to the PATH
set PATH ~/.ignition/macOS/bin $PATH

# Source enviromental variables
source ~/.env.sh
