# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Install packages

apps=(
  git
  hub
  # Add --with-brewed-openssl for El Capitan. https://github.com/Homebrew/homebrew/issues/40519#issuecomment-110468872
  vim --with-brewed-openssl
  wget
  awscli
  ack
  the_silver_searcher
  # ruby
  rbenv
  ruby-build
  # database
  postgresql
  redis
  heroku-toolbelt
  # NTFS
  homebrew/fuse/ntfs-3g
  # node.js
  node
)

brew install "${apps[@]}"

# Install by using cask

apps=(
  osxfuse
)

brew cask install "${apps[@]}"

# Heroku
heroku plugins:install https://github.com/heroku/heroku-accounts.git
heroku accounts:add personal
