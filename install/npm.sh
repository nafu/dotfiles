# Install packages

apps=(
  gitbook-cli
  # Firebase CLI
  firebase-tools
  # Redux
  redux-cli
  # Git stats
  git-stats
)

npm install -g "${apps[@]}"
