# Update Homebrew, formulae, and packages

brew update
brew upgrade

# Requirements

## ntfs-3g
brew install --cask osxfuse
## ec2-api-tools
brew install --cask adoptopenjdk8

# Install packages

apps=(
  git
  git-lfs
  # GitHub
  gh
  ghq
  hub
  peco
  # Required to use neocomplete.vim
  lua
  # Utility
  vim
  wget
  awscli
  ack
  the_silver_searcher
  jq
  asdf
  ## zsh
  autojump
  zsh-syntax-highlighting
  # Terminal
  tmux
  # ruby
  gmp
  rbenv
  ruby-build
  # rust
  rustup-init
  # database
  postgresql
  redis
  heroku/brew/heroku
  # NTFS
  ntfs-3g
  # node.js
  node
  nvm
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
  youtube-dl
  # File
  unar
  # PHP
  composer
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
  # Javascript
  yarn
  # Vim
  ctags
  # Morphological analysis
  jumanpp
  # GNU coreutils for gsort with -h option
  # https://unix.stackexchange.com/questions/4681/how-do-you-sort-du-output-by-size
  coreutils
  # Scala
  sbt
  # Go
  golang
  # iOS
  carthage
  # Stats
  cloc
  # 1Password
  1password-cli
)

brew install "${apps[@]}"

# Install by using cask

apps=(
  alfred
  google-chrome
  google-japanese-ime
  dropbox
  1password7
  spectacle
  # Requirement for inkscape
  xquartz
  # SVG
  inkscape
  # To install ebook-convert and generate pdf and ebook for gitbook
  calibre
  # Android
  android-studio
  intel-haxm
  # Docker
  docker
  # Presentation
  keycast
  keycastr
  deckset
  # Xcode
  alcatraz
  # Asset Catalog Thinkerer to open .car files
  # https://github.com/insidegui/AssetCatalogTinkerer
  asset-catalog-tinkerer
  # Editor
  ## Xcode
  xcodes
  ## Text Editor
  coteditor
  ## Markdown Editor
  macdown
  ## VSCode
  visual-studio-code
  # Mac
  spectacle
  # Communication
  slack
  zoom
  # Design
  abstract
  skitch
  figma
  # Debug
  charles
  # Google Cloud
  google-cloud-sdk
  # Stripe
  stripe/stripe-mock/stripe-mock
  # Media
  vlc
)

brew install --cask "${apps[@]}"

# Other packages

## Codeclimate
brew tap codeclimate/formulae
brew install codeclimate

## iOS
brew tap yonaskolb/XcodeGen https://github.com/yonaskolb/XcodeGen.git
brew install XcodeGen

# Initial setup

## GitHub
gh extension install github/gh-copilot

## Java
launchctl setenv JAVA8_HOME `/usr/libexec/java_home -v 1.8`

## Heroku
heroku plugins:install heroku-accounts
heroku accounts:add personal
heroku autocomplete --refresh-cache

### https://junjizhi.medium.com/the-right-way-to-clear-heroku-build-cache-78f065c9fd18
heroku plugins:install heroku-builds

## Rust
rustup-init
