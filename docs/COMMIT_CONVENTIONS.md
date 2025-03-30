# 📜 Club Steam Commit Message Guidelines

This guide defines a standard for writing commit messages in the **Club Steam** project using **Gitmoji** and the **Conventional Commits** specification.  

Following this guide ensures clarity, consistency, and better collaboration.

## 📌 Link to Commit Specification

- [Conventional Commits Specification](https://github.com/RazFernandez/club_steam_app)  
- [Gitmoji](https://gitmoji.dev)  

## ✨ Commit Structure

Each commit message should follow this format:

```md
<gitmoji> <type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

- `<gitmoji>`: A relevant emoji to visually represent the type of change.
- `<type>`: A predefined category that describes the purpose of the commit.
- `<scope> (optional)`: The part of the project affected by the change (e.g., LoginForm, InfoCard, API).
- `<description>`: A concise summary of the change in imperative form (e.g., "Fix bug in authentication"). **(what)**
- `[optional body]`: A more detailed description of the change to add context. **(why)**
- `[optional footer(s)]`: Add metadata info about the commit such as BREAKING CHANGE or author.

### Commit Subject Prefix
To ensure clarity and consistency, commit subjects should use these prefixes:
- `Added`: New functionality or files.
- `Updated`: Modifications that do not add or fix behavior (e.g., dependencies, documentation).
- `Fixed`: Corrections to existing code that resolve bugs or issues.
- `Removed`: Deletions of files or code that are no longer necessary.
- `Refactored`: Structural changes that do not alter existing functionality.

## 📖 List of type of commits

| Emoji | type | Description|
| :-----: | :----: | :---------- |
| ⭐ | `feat` | Used when adding a new feature to the project. This represents a significant addition to the codebase. |
| 🐛 | `fix` | Used when fixing a bug in the project. This includes any change that corrects unexpected behavior. |
| ♻️ | `refact` | Used for code restructuring that does not change the behavior, such as improving readability, modularization, or simplifying logic. |
| 📚 | `docs` | Used when updating or adding documentation files, such as `README.md`, API docs, or in-code comments. |
| 🎨 | `style` |Used for changes that do not affect functionality, such as code formatting, indentation, or whitespace adjustments. |
| ⚡ | `perf` | Used when making performance improvements, such as optimizing algorithms, reducing memory usage, or improving execution time. |
| 🧪 | `test` | Used for adding or modifying tests, such as unit tests, integration tests, or updating test cases. |
| 🛠 | `config` | Used when modifying configuration files that define rules, settings, or environment variables, such as `.gitignore`, `.editorconfig`, or `analysis_options.yaml`. |
| 🏗 | `build` | Used for changes that affect the build system or external dependencies, such as modifying `pubspec.yaml` dependencies, build scripts, or Flutter flavors. |
| 🔧 | `chore` | Used for maintenance tasks that do not affect the source code, such as renaming files, minor repository cleanup, or updating package versions without functional changes. |
| ⚙️ | `ci` | Used for changes related to CI/CD configuration, such as modifying GitHub Actions, Jenkins, or pipeline scripts. |
| ⏪ | `revert` | Used when reverting a previous commit that introduced an issue or is no longer needed. |

## 📝 Examples





