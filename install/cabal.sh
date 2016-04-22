# Update haskell packages

cabal update

# Install packages

apps=(
  tidal
)

cabal install "${apps[@]}"
