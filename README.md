# ⚓ terminalMoses 
Parting the sea of logs for developers who hate scrolling

### Install in one second:
> **Note:** Piping to bash is controversial, but it's fast. For a safer installation, see the manual method below.
```bash
curl -fsSL https://raw.githubusercontent.com/brightyorcerf/terminalMoses/main/install.sh | bash
```

### Safer Manual Install:
If you prefer not to pipe to bash, you can clone and run it manually:
```bash
git clone https://github.com/brightyorcerf/terminalMoses.git
cd terminalMoses
chmod +x install.sh
./install.sh
```

### Configuration
Open `~/moses.zsh` to customize:
- `MOSES_STAFF`: Change the main color (`green`, `magenta`, `cyan`, `white`)
- `MOSES_PLAGUE`: Change the error color (`red`, `brightblack`)
- `MOSES_MODE`: Set to `"minimal"` for a compact, fast-paced view.