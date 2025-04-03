# 📌 Club Steam Branch Structure Guide

This document outlines the branch structure and naming conventions used in the **Club Steam** repository to maintain a well-organized and efficient workflow.

---

## 🌳 Main Branches

### `main`
- The main branch where stable releases are deployed.
- Only contains tested and approved code.

### `development`
- The primary branch for active development.
- New features and bug fixes are created and merged here before moving to `main`.

### `testing`
- Dedicated branch for testing tools and frameworks.
- Used to develop and refine automated tests.

### `docs`
- Reserved for documentation-related changes.
- Any updates to README, API docs, or internal guides happen here.

### `devops`
- Handles DevOps activities.
- Includes CI/CD workflow updates, security improvements, and repository-wide configurations.

### `chore`
- Used for minor repository maintenance.
- Covers renaming files, formatting code, or removing irrelevant files.

---

## 🔀 Branch Naming Convention

To ensure consistency and readability, branches should follow this structure:

```plaintext
[Main Branch]-[Relevant Description]-#IssueNumber
```

### 📌 Examples:
- `development-feat-newButton-#123` → Adding a new button feature.
- `testing-fix-loginBug-#45` → Fixing a bug in the login process.
- `docs-update-setupGuide-#78` → Updating the setup guide documentation.
- `devops-ci-newWorkflow-#91` → Creating a new CI/CD workflow.
- `chore-remove-unusedFiles-#34` → Deleting obsolete files.
