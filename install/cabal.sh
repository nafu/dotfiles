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
