## How to update tap

Use the tasks in `Taskfile.yml` to manage formula updates:

```bash
# View all tasks
taskr --list

# Update to a new version (Note: use -- as a separator)
taskr update -- 3.47.7

# Verify changes
taskr verify

# Commit changes
taskr commit

# Test installation
taskr test

# View current version
taskr version

# Check status
taskr status

# Full release process (Note: use -- as a separator)
taskr release -- 3.47.7
```

**Important:** When passing the version number parameter, you must use the `--` separator, because Task will misinterpret the version number containing a dot as a task name.

## How Homebrew Tap Works (Simple Version)

### What is Homebrew?
Homebrew is a software installation tool for macOS, like a command-line version of the App Store.

### What is a Tap?
A Tap provides additional software sources. By default, only official software is included; a tap can add more sources.

### What is a Formula?
A Formula is an installation instruction that tells Homebrew:
- Where to download the software from
- How to install it
- What dependencies are needed

### How it works (simple version)

```
1. You create a "tap"
   └─> Like opening a small shop

2. You put "formulas" (installation instructions) in the shop
   └─> The instructions tell customers how to install the software

3. The customer (user) opens your shop
   └─> brew tap vikbert/taskr

4. The customer installs the software according to the instructions
   └─> brew install taskr

5. Homebrew automatically:
   - Downloads the software
   - Checks file integrity (SHA256)
   - Installs it to the correct location
   - Creates command links
```

### Your project structure

```
homebrew-taskr/          ← This is your "shop"
├── Formula/            ← This is where the "instructions" are stored
│   └── taskr.rb        ← This is the installation instruction for taskr
└── README.md           ← The sign at the entrance of the shop
```

### Actual process

1.  **User runs:** `brew tap vikbert/taskr`
    *   Homebrew downloads your repository from GitHub

2.  **User runs:** `brew install taskr`
    *   Homebrew reads `Formula/taskr.rb`
    *   Follows the instructions to download, verify, and install

3.  **When you update the version:**
    *   Modify the version number and download address in `taskr.rb`
    *   Push to GitHub
    *   Users can update by running `brew update && brew upgrade taskr`

### Analogy summary

-   **Homebrew** = App Store
-   **Tap** = Your shop
-   **Formula** = Installation instructions
-   **Your repository** = The warehouse of the shop

Users install software through your tap, just like buying things from your shop!