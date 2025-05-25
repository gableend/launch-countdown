#!/bin/bash

# Git Health Check Script
# Verifies git configuration and authentication

echo "🏥 Git Health Check for launch-countdown project"
echo "================================================="
echo ""

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Not in a git repository"
    exit 1
fi

echo "✅ Git repository detected"
echo ""

# Check git configuration
echo "🔧 Git Configuration:"
echo "  User: $(git config user.name) <$(git config user.email)>"
echo "  Credential Helper: $(git config credential.helper)"
echo ""

# Check remote configuration
echo "🌐 Remote Configuration:"
git remote -v
echo ""

# Check authentication
echo "🔐 Testing Authentication..."
if git ls-remote origin >/dev/null 2>&1; then
    echo "✅ Authentication successful"
else
    echo "❌ Authentication failed"
    exit 1
fi
echo ""

# Check if there are any uncommitted changes
echo "📂 Working Directory Status:"
if git diff --quiet && git diff --cached --quiet; then
    echo "✅ Working directory clean"
else
    echo "⚠️  Uncommitted changes detected:"
    git status --porcelain
fi
echo ""

# Check branch status
echo "🌿 Branch Status:"
echo "  Current branch: $(git branch --show-current)"
echo "  Tracking: $(git branch -vv | grep '*' | cut -d' ' -f2-)"
echo ""

# Test token validity
echo "🔑 Token Validation:"
if curl -s -f -H "Authorization: token $(git config --get credential.helper | grep -o 'gho_[a-zA-Z0-9_]*' || echo 'token-not-found')" https://api.github.com/user >/dev/null 2>&1; then
    echo "✅ GitHub token is valid"
else
    echo "⚠️  Could not validate GitHub token"
fi
echo ""

echo "🎉 Health check complete!"
echo ""
echo "📚 For detailed workflow instructions, see: GIT_WORKFLOW.md"
echo "🚀 To commit and push changes: ./git-push.sh \"your message\""