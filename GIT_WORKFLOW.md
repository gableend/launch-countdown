# Git Workflow Documentation

## Current Configuration Status ✅

The git repository is properly configured and working. Last tested: May 25, 2025

### Repository Details
- **Repository**: https://github.com/gableend/launch-countdown
- **Remote URL**: https://github.com/gableend/launch-countdown.git
- **Branch**: main
- **Authentication**: HTTPS with Personal Access Token

### Git Configuration
```bash
user.name=gableend
user.email=graeme.chard@gmail.com
credential.helper=store
```

## Standard Workflow

### 1. Check Status Before Making Changes
```bash
cd launch-countdown
git status
```

### 2. Stage and Commit Changes
```bash
# Stage specific files
git add filename.ext

# Or stage all changes
git add .

# Commit with descriptive message
git commit -m "feat: add new component" 
# or
git commit -m "fix: resolve authentication issue"
# or  
git commit -m "docs: update workflow documentation"
```

### 3. Push to GitHub
```bash
git push origin main
```

### 4. Pull Latest Changes (if working with others)
```bash
git pull origin main
```

## Troubleshooting Authentication Issues

### If Push Fails with Authentication Error:

1. **Check if token is stored**:
   ```bash
   git credential-store --file ~/.git-credentials get <<< "protocol=https
   host=github.com"
   ```

2. **Test remote connectivity**:
   ```bash
   git ls-remote origin
   ```

3. **If token expired**, update stored credentials:
   ```bash
   # Remove old credentials
   git credential-store --file ~/.git-credentials erase <<< "protocol=https
   host=github.com"
   
   # Next push will prompt for new token
   git push origin main
   ```

### Personal Access Token Requirements

Your GitHub Personal Access Token needs these permissions:
- ✅ **repo** (Full control of private repositories)
- ✅ **workflow** (Update GitHub Action workflows)

## Token Security Best Practices

1. **Never commit tokens to code**
2. **Set reasonable expiration dates** (recommend 90 days - 1 year)
3. **Use fine-grained tokens when possible**
4. **Regularly rotate tokens**

## Current Token Info
- Format: `gho_*` (Classic Personal Access Token)
- Stored in: `~/.git-credentials` (credential helper: store)
- Last verified: May 25, 2025

## Emergency Reset Process

If authentication completely fails:

1. **Generate new token**:
   - Go to GitHub.com → Settings → Developer settings → Personal access tokens
   - Generate new token with 'repo' scope
   - Copy the token immediately

2. **Clear old credentials**:
   ```bash
   git credential-store --file ~/.git-credentials erase <<< "protocol=https
   host=github.com"
   ```

3. **Test with new token**:
   ```bash
   git push origin main
   # Enter username: gableend
   # Enter password: [paste new token]
   ```

## Netlify Auto-Deploy

The repository is connected to Netlify for automatic deployment:
- **Live URL**: https://same-2lvhtp8k4l7-latest.netlify.app
- **Trigger**: Every push to main branch
- **Build Command**: `bun run build`
- **Publish Directory**: `dist`

## Common Git Commands Reference

```bash
# View commit history
git log --oneline -10

# View remote repositories
git remote -v

# Check git configuration
git config --list

# View file differences
git diff filename.ext

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Undo last commit (discard changes)
git reset --hard HEAD~1

# View branch information
git branch -a
```

---

**Last Updated**: May 25, 2025  
**Status**: ✅ Working - Authentication verified  
**Next Review**: Check token expiration in 30 days