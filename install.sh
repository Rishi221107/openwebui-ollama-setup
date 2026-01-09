#!/usr/bin/env bash
set -e

echo "🚀 Installing OpenWebUI + Ollama..."

# Check Docker
if ! command -v docker &> /dev/null; then
  echo "❌ Docker not found. Install Docker first."
  exit 1
fi

# Clone repo if not present
REPO_URL="https://github.com/YOUR_USERNAME/openwebui-ollama-setup.git"
DIR_NAME="openwebui-ollama-setup"

if [ ! -d "$DIR_NAME" ]; then
  git clone "$REPO_URL"
fi

cd "$DIR_NAME"

# Environment file
if [ ! -f ".env" ]; then
  cp .env.example .env
fi

# Start services
docker compose up -d

# Pull model
docker exec -it ollama ollama pull llama3.2

echo ""
echo "✅ Installation Complete!"
echo "🌐 OpenWebUI: http://localhost:3000"
