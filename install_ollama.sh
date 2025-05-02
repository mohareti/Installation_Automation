#!/bin/bash

# Exit script if any command fails
set -e

echo "Updating Homebrew..."
brew update

# Check if Ollama is installed
if ! command -v ollama &> /dev/null; then
    echo "Installing Ollama..."
    brew install ollama
else
    echo "Ollama is already installed."
fi

# Start Ollama service (if needed)
echo "Starting Ollama..."
ollama serve &

# Pull the CodeLlama 13B model
echo "Pulling CodeLlama:13B model..."
ollama pull codellama:13b

# Run a test inference
echo "Running a test prompt on CodeLlama..."
ollama run codellama:13b "Write a Python function to add two numbers."

echo "Setup complete! Ollama and CodeLlama:13B are ready to use."
