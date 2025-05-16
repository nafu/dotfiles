# Install packages

apps=(
  gitbook-cli
  # Firebase CLI
  firebase-tools
  # Redux
  redux-cli
  # Git stats
  git-stats
  # Google Apps Script
  # https://github.com/danthareja/node-google-apps-script
  node-google-apps-script
  # AWS Serverless
  serverless
  # AI
  repomix
  @openai/codex
)

npm install -g "${apps[@]}"
