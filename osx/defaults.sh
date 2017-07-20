# Usage: `. osx/defaults.sh`

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: allow quitting via ⌘  + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# 2D dock for Leopard
defaults write com.apple.dock no-glass -boolean true

###############################################################################
# Dashboard                                                                   #
###############################################################################

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.0

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

###############################################################################
# Mission Control                                                             #
###############################################################################

# Don't make displays have separate Spaces
defaults write com.apple.spaces spans-displays -bool true

# Speed up Mission Control, App Expose animations
defaults write com.apple.dock expose-animation-duration -float 0.0

###############################################################################
# Keyboard                                                                    #
###############################################################################

# Disabling press-and-hold for special keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

###############################################################################
# Xcode                                                                       #
###############################################################################

# Show build operation duration on Xcode
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
