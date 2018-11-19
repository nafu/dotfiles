# Update haskell packages

cabal update

# Install packages

apps=(
  tidal
)

cabal install "${apps[@]}"

# Dirt for Tidal
DIRT_DIR=~/Dirt
if [ ! -d "$DIRT_DIR" ]; then
  git clone --recursive https://github.com/tidalcycles/Dirt.git $DIRT_DIR
  pushd $DIRT_DIR
  make clean; make
  popd
fi

# OS X users: On OS X with GHC 7.10 it is necessary to reinstall PortMidi again with frameworks correctly linked:
cabal install PortMidi --ghc-options="-optl-Wl,-framework,CoreMIDI,-framework,CoreAudio" --reinstall --jobs=1 --force-reinstalls

if ! command -v tidalvim >/dev/null; then
  pushd ~/.vim/bundle/vim-tidal
  sudo make install
  popd
fi
