# Setup Checklist — Commons OS

For cases where the setup script can't run (permissions, GitHub plan limitations, etc.), walk through this manually:

| Step | What | How | Automated? |
|---|---|---|---|
| **1. Labels** | Create dimension + type + priority labels with correct colours | `.commons/setup.sh` or manual via Settings → Labels | ✅ Script |
| **2. Project Board** | Create Operations board with columns | `gh project create` or manual via Projects tab | ✅ Script |
| **3. Milestones** | Create Boot, Seed, Active milestones | `gh api` or manual via Issues → Milestones | ✅ Script |
| **4. Branch protection** | Require PR for main branch | `gh api` — requires GitHub Pro for private repos | ⚠️ Plan-dependent |
| **5. GitHub Pages** | Enable Pages for extranet (public) | Settings → Pages → Source: gh-pages branch | ⚠️ Manual for private repos |
| **6. Pages custom domain** | Link custom domain (optional) | Settings → Pages → Custom domain | ❌ Manual |
| **7. Secrets** | Add MCP API key (if PEER+ tier) | Settings → Secrets → `COMMONS_MCP_API_KEY` | ❌ Manual |
| **8. Upstream remote** | Set upstream for collection sync | `git remote add upstream ...` | ✅ Script |
| **9. Collaborators** | Invite team members | Settings → Collaborators | ❌ Manual |
