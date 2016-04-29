# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Install packages

apps=(
  git
  git-lfs
  hub
  # Add --with-brewed-openssl for El Capitan. https://github.com/Homebrew/homebrew/issues/40519#issuecomment-110468872
  vim --with-brewed-openssl
  wget
  awscli
  ack
  the_silver_searcher
  # Terminal
  tmux
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
  # AWS
  ec2-api-tools
  # CI
  bitrise
  # Python
  pyenv
  # GIF
  gifsicle
  # Dirt and Haskell (Dependencies of Tidal)
  liblo
  libsndfile
  libsamplerate
  jack
  ghc
  cabal-install
  # pbcopy with Tmux
  reattach-to-user-namespace
)

brew install "${apps[@]}"

# Install by using cask

apps=(
  osxfuse
  # To install ebook-convert and generate pdf and ebook for gitbook
  calibre
  # Install Java8
  java
  # Android
  android-studio
  intel-haxm
  # Docker
  dockertoolbox
)

brew cask install "${apps[@]}"

# Java
launchctl setenv JAVA8_HOME `/usr/libexec/java_home -v 1.8`

# Heroku
heroku plugins:install https://github.com/heroku/heroku-accounts.git
heroku accounts:add personal
