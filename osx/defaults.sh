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
