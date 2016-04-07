#!/bin/sh

# Avoid corruption of Preferences Pane by adding an app to thelist more than once.
function addCustomMenuEntryIfNeeded
{
  if [[ $# == 0 || $# > 1 ]]; then
    echo "usage: addCustomMenuEntryIfNeeded com.company.appname"
    return 1
  else
    local contents=`defaults read com.apple.universalaccess "com.apple.custommenu.apps"`
    local grepResults=`echo $contents | grep $1`
    if [[ -z $grepResults ]]; then
      # does not contain app
      defaults write com.apple.universalaccess "com.apple.custommenu.apps" -array-add "$1"
    else
      # contains app already, so do nothing
    fi
  fi
}

function fixKeyboardShortcuts
{
    local COMMAND_KEY_SYMBOL="@"
    local CONTROL_KEY_SYMBOL="^"
    local OPTION_KEY_SYMBOL="~"
    local SHIFT_KEY_SYMBOL="$"
    local TAB_KEY_SYMBOL="\\U21e5"

    # Terminal
    # Show Next Tab: Control-Tab
    # Show Previous Tab: Control-Shift-Tab
    # Use Select instead of Show in old machine.
    defaults write com.apple.Terminal NSUserKeyEquivalents "{
        'Show Next Tab' = '${CONTROL_KEY_SYMBOL}${TAB_KEY_SYMBOL}';
        'Show Previous Tab' = '${CONTROL_KEY_SYMBOL}${SHIFT_KEY_SYMBOL}${TAB_KEY_SYMBOL}';
    }"
    addCustomMenuEntryIfNeeded "com.apple.Terminal"

    # Restart cfprefsd and Finder for changes to take effect.
    # You may also have to restart any apps that were running
    # when you changed their keyboard shortcuts. There is some
    # amount of voodoo as to what you do or do not have to
    # restart, and when.
    killall cfprefsd
    killall Finder
}

# Run the function
fixKeyboardShortcuts
