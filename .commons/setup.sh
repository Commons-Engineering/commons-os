#!/bin/bash
# Commons OS — Repository Setup
# Run after creating from template: .commons/setup.sh

set -e

REPO=$(gh repo view --json nameWithOwner -q '.nameWithOwner')
echo "🏗️  Setting up Commons OS for $REPO"

# 1. Labels (GitHub templates don't carry label colours/descriptions)
echo "Creating labels..."
gh label create "definition" --color "0075CA" --description "Definition & Purpose (D1)" --force -R "$REPO"
gh label create "participation" --color "E4E669" --description "Participation & Relationship (D2)" --force -R "$REPO"
gh label create "proposition" --color "A2EEEF" --description "Proposition & Exchange (D3)" --force -R "$REPO"
gh label create "production" --color "F9D0C4" --description "Production & Resilience (D4)" --force -R "$REPO"
gh label create "deliberation" --color "D876E3" --description "Open deliberation" --force -R "$REPO"
gh label create "decision" --color "5319E7" --description "Architectural or design decision" --force -R "$REPO"
gh label create "build" --color "0E8A16" --description "Build task" --force -R "$REPO"
gh label create "critical" --color "B60205" --description "Critical priority" --force -R "$REPO"
gh label create "high" --color "FF9F1C" --description "High priority" --force -R "$REPO"
gh label create "normal" --color "C5DEF5" --description "Normal priority" --force -R "$REPO"

# 2. Project Board
echo "Creating project board..."
gh project create --owner "$(echo $REPO | cut -d/ -f1)" --title "$(basename $REPO) Operations" --format board 2>/dev/null || echo "⚠️  Project board may already exist or requires manual creation"

# 3. Milestones
echo "Creating milestones..."
gh api repos/$REPO/milestones -X POST -f title="Boot" -f description="Complete the boot sequence (Phases 1-6)" 2>/dev/null || echo "⚠️  Boot milestone may already exist"
gh api repos/$REPO/milestones -X POST -f title="Seed" -f description="First external entities, community forming" 2>/dev/null || echo "⚠️  Seed milestone may already exist"
gh api repos/$REPO/milestones -X POST -f title="Active" -f description="Regular production, engagement, operating rhythms" 2>/dev/null || echo "⚠️  Active milestone may already exist"

# 4. Branch protection (main requires PR)
echo "Configuring branch protection..."
gh api repos/$REPO/branches/main/protection -X PUT \
  -f "required_pull_request_reviews[required_approving_review_count]=0" \
  -F "enforce_admins=false" \
  -F "required_status_checks=null" \
  -F "restrictions=null" 2>/dev/null || echo "⚠️  Branch protection requires GitHub Pro or public repo"

# 5. GitHub Pages
echo "Configuring GitHub Pages..."
gh api repos/$REPO/pages -X POST \
  -f "source[branch]=gh-pages" \
  -f "source[path]=/" 2>/dev/null || echo "⚠️  Pages may need manual setup (Settings > Pages)"

# 6. Upstream remote for collection sync (template copies only)
echo "Setting up upstream remote..."
git remote add upstream https://github.com/commons-engineering/commons-os.git 2>/dev/null || echo "Upstream remote already configured"

echo ""
echo "✅ Setup complete for $REPO"
echo ""
echo "Next steps:"
echo "  1. Open the repo in your AI agent (Claude Code, etc.)"
echo "  2. Say: 'Boot this instance'"
echo "  3. The agent will guide you through the boot sequence"
echo ""
echo "Verify: gh project list --owner $(echo $REPO | cut -d/ -f1)"
