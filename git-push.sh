#!/bin/bash

# Git Push Helper Script
# Usage: ./git-push.sh "commit message"

set -e  # Exit on any error

# Check if we're in the right directory
if [ ! -d ".git" ]; then
    echo "Error: Not in a git repository"
    exit 1
fi

# Check if commit message is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a commit message"
    echo "Usage: ./git-push.sh \"your commit message\""
    exit 1
fi

echo "🔍 Checking git status..."
git status

echo ""
echo "📝 Staging all changes..."
git add .

echo ""
echo "✅ Committing changes..."
git commit -m "$1"

echo ""
echo "🚀 Pushing to GitHub..."
git push origin main

echo ""
echo "✨ Successfully pushed to GitHub!"
echo "🌐 Live site: https://same-2lvhtp8k4l7-latest.netlify.app"
echo "📚 Repository: https://github.com/gableend/launch-countdown"