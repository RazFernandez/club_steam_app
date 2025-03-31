# 📜 Club Steam Commit Message Guidelines

This guide defines a standard for writing commit messages in the **Club Steam** project using **Gitmoji** and the **Conventional Commits** specification.  

Following this guide ensures clarity, consistency, and better collaboration.

</br>

## 📃 Table of contents
1. [📌 Link to Commit Specification](#-link-to-commit-specification)
2. [✨ Commit Structure](#-commit-structure)
   - [🔔 Commit Subject Prefix](#-commit-subject-prefix)
   - [✅ Allowed Footers](#-allowed-footers)
3. [📖 List of type of commits](#-list-of-type-of-commits)
4. [📝 Examples](#-examples)
   - [✏️ Types of commits](#%EF%B8%8F-types-of-commits)
   - [📄 Full commit messagess](#-full-commit-messages)
</br>

## 📌 Link to Commit Specification

- [Conventional Commits Specification](https://github.com/RazFernandez/club_steam_app)  
- [Gitmoji](https://gitmoji.dev)

</br>

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

</br>

### 🔔 Commit Subject Prefix
To ensure clarity and consistency, commit subjects should use these prefixes:
- `Added`: New functionality or files.
- `Updated`: Modifications that do not add or fix behavior (e.g., dependencies, documentation).
- `Fixed`: Corrections to existing code that resolve bugs or issues.
- `Removed`: Deletions of files or code that are no longer necessary.
- `Refactored`: Structural changes that do not alter existing functionality.

</br>

### ✅ Allowed Footers
To ensure clarity and consistency, these are allowed footers for commit messages:
- `Acked-by`: Indicates who reviewed and approved the change.
- `Co-authored-by`: Specifies additional contributors to the commit.
- `Signed-off-by`: Used to certify that the committer has the right to submit the change.  
- `BREAKING CHANGE`: Highlights breaking changes that require attention.
- `Fixes`: References an issue that the commit resolves.
- `Closes`: Marks an issue as completed when the commit is merged.

</br>
  
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
| 🚨 | `breaking` | Used when introducing a breaking change that requires modifications in dependent parts of the system. Requires a `BREAKING CHANGE:` note in the commit body. |

</br>

## 📝 Examples

### ✏️ Types of commits
1. **Feature addition**:
```md
⭐ feat(LoginForm): Added support for biometric authentication
```
2. **Bug fix:**
```md
🐛 fix(API): Fixed null pointer exception on user data fetch
```
3. **Documentation update:**
```md
📚 docs(README): Updated setup instructions
```
4. **Refactoring:**
```md
♻️ refact(InfoCard): Refactored widget tree for better readability
```
5. **Performance improvement:**
```md
⚡ perf(Database): Optimized query performance for faster load times
```
6. **Testing update:**
```md
🧪 test(AuthService): Added unit tests for login validation
```
7. **CI/CD change:**
```md
🚀 ci(GitHub Actions): Updated deployment script
```
8. **Build system update:**
```md
🛠️ build(Gradle): Updated dependencies to latest versions
```
9. **Reverting a change**:
```md
⏪ revert(LoginForm): Removed biometric authentication feature
```
10. **Configuration file update**:
```md
⚙️ config(gitignore): Updated ignored files to include logs directory
```

</br>

### 📄 Full commit messages

```md
⭐ feat(Auth): Added biometric authentication  

Added support for fingerprint and face recognition in the login screen.  

Co-authored-by: John Doe <johndoe@example.com>  
```

```md
🐛 fix(Database): Fixed null pointer exception when fetching user data  

Fixed a crash occurring when the user data response was empty.  

Fixes: #123  
```

```md
📚 docs(README): Added installation guide for new contributors  

Updated the README file with step-by-step setup instructions.  

Acked-by: Miguel Fernandez  
```

```md
🚀 ci(GitHub Actions): Fixed deployment script for production  

Updated the workflow file to correctly deploy to Firebase Hosting.  

Signed-off-by: Miguel Fernandez <miguel@example.com>  
```

```md
🚨 feat(API)!: Changed authentication flow to token-based system  

Refactored authentication to use JWT instead of session cookies.  

BREAKING CHANGE: All users must re-authenticate due to the new token system.  
```

```md
⏪ revert(Auth): Removed biometric authentication feature  

The feature was causing compatibility issues with certain devices.  

Closes: #456  
```

