# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Install packages

apps=(
  git
  git-lfs
  hub
  # Required to use neocomplete.vim
  lua
  # Add --with-brewed-openssl for El Capitan. https://github.com/Homebrew/homebrew/issues/40519#issuecomment-110468872
  vim --with-brewed-openssl --with-lua
  wget
  awscli
  ack
  the_silver_searcher
  # Terminal
  tmux
  # ruby
  gmp
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
  s3cmd
  awsebcli
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
  # Mediamedia
  ffmpeg
  # PHP
  homebrew/php/composer
  # Image Manipulation
  imagemagick
  ghostscript
  ## Image Compression
  pngquant
  ## Graphviz
  graphviz
  # Swift
  cmake
  ninja
  swiftlint
  # GPG
  gpg
  # WP
  wp-cli
  # SVG
  homebrew/gui/inkscape
  # Javascript
  yarn
  # Vim
  ctags
  # Morphological analysis
  jumanpp
  # GNU coreutils for gsort with -h option
  # https://unix.stackexchange.com/questions/4681/how-do-you-sort-du-output-by-size
  coreutils
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
  docker
  # Presentation
  keycast
  keycastr
  # Xcode
  alcatraz
  # Scala
  sbt
  # Asset Catalog Thinkerer to open .car files
  # https://github.com/insidegui/AssetCatalogTinkerer
  asset-catalog-tinkerer
  # Markdown Editor
  macdown
)

brew cask install "${apps[@]}"

# Other packages

## Codeclimate
brew tap codeclimate/formulae
brew install codeclimate

## iOS
brew tap yonaskolb/XcodeGen https://github.com/yonaskolb/XcodeGen.git
brew install XcodeGen

# Initial setup

## Java
launchctl setenv JAVA8_HOME `/usr/libexec/java_home -v 1.8`

## Heroku
heroku plugins:install heroku-accounts
heroku accounts:add personal
