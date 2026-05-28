# nvim config

Personal config shared across machines. Designed for local and SSH remote dev.

## Requirements

- Neovim >= 0.11
- `git`
- `ripgrep` (for live grep)
- `curl` + `python3` (for npm→bun Mason shim)
- One of: `bun` (preferred on servers), `npm`, or `node` — for npm-based LSPs

### Per-language

| Language | Requirement |
|---|---|
| PHP | `php` >= 8.0 in PATH |
| Rust | `rustup` + `rust-analyzer` component |
| Python | none (pyright via Mason) |
| Flutter/Dart | Flutter SDK |
| All others | Mason handles automatically |

## Installation

```sh
git clone <repo> ~/.config/nvim
nvim  # Lazy auto-installs plugins on first launch
```

Mason auto-installs LSPs on first launch. On servers with `bun` but broken/missing `npm`, the shim at `bin/npm` is used automatically.

## Plugins

| Plugin | Purpose |
|---|---|
| `lazy.nvim` | Plugin manager |
| `mason.nvim` + `mason-lspconfig` | LSP installer |
| `nvim-lspconfig` | LSP client config |
| `nvim-cmp` + `LuaSnip` | Completion + snippets |
| `friendly-snippets` | Snippet collection (PHP, TS, Python, etc.) |
| `nvim-treesitter` | Syntax / highlighting / indent |
| `telescope.nvim` | Fuzzy finder |
| `nvim-tree` | File explorer |
| `barbar.nvim` | Tab bar |
| `neaterm.nvim` | Terminal manager + REPL |
| `mini.diff` | Git hunk diff viewer |
| `gitsigns.nvim` | Git signs in gutter |
| `Comment.nvim` | Toggle comments |
| `nvim-autopairs` | Auto-close brackets |
| `indent-blankline` | Indent guides |
| `alpha-nvim` | Dashboard |
| `galaxyline.nvim` | Status line |
| `themery.nvim` | Theme switcher |
| `schemastore.nvim` | YAML/JSON schema validation |
| `lspkind.nvim` | LSP completion icons |
| `rustaceanvim` | Rust extras |
| `flutter-tools.nvim` | Flutter/Dart support |

## LSPs

| Language | Server | npm-free |
|---|---|---|
| Lua | `lua_ls` | ✓ binary |
| Rust | `rust_analyzer` | ✓ binary |
| PHP | `phpactor` | ✓ PHP PHAR |
| Python | `pyright` | via bun shim |
| TypeScript/JS | `ts_ls` | via bun shim |
| HTML | `html` | via bun shim |
| CSS | `cssls` | via bun shim |
| Markdown | `marksman` | ✓ binary |
| YAML | `yamlls` | via bun shim |

## Keybindings

**Leader = `Space`**

### LSP

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gi` | Implementation |
| `K` | Hover docs |
| `gs` | Signature help |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>d` | Diagnostic float (detail at cursor) |
| `<leader>q` | All diagnostics → location list |
| `[d` / `]d` | Prev / next diagnostic |
| `<leader>p` | Format file |

### File Tree (nvim-tree)

| Key | Action |
|---|---|
| `<C-n>` | Toggle |
| `<leader>e` | Focus |
| `<leader>n` | Reveal current file |
| `<leader>c` | Collapse all |

### Tabs (barbar)

| Key | Action |
|---|---|
| `<Tab>` / `<S-Tab>` | Next / prev |
| `<C-1>` … `<C-9>` | Jump to tab N |
| `<C-0>` | Last tab |
| `<leader>x` | Close buffer |
| `<C-p>` | Pick buffer (visual) |
| `<A-p>` | Pin / unpin |
| `<A-<>` / `<A->>` | Reorder left / right |

### Search (Telescope)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |

### Terminal (neaterm)

| Key | Action |
|---|---|
| `<C-t>` | Toggle terminal |
| `<C-A-t>` | Float terminal |
| `<leader>v` / `<leader>h` | Vertical / horizontal split |
| `<A-d>` | Close |
| `<leader>tn` / `<leader>tp` | Next / prev terminal |
| `<leader>rt` | Toggle REPL |
| `<leader>rl` | Send line to REPL |
| `<leader>rs` | Send selection to REPL |
| `<leader>rb` | Send buffer to REPL |
| `<leader>rc` / `<leader>rh` | Clear / history |

REPL support: Python (IPython), R (Radian), Lua, Node.js, Shell.

Custom floats: `ranger`, `lazygit`, `btop` — launch via `:NeatermOpen ranger` etc.

### Git (mini.diff)

| Key | Action |
|---|---|
| `]h` / `[h` | Next / prev hunk |
| `]H` / `[H` | Last / first hunk |
| `gh` | Apply hunk |
| `gH` | Reset hunk |

### Completion

| Key | Action |
|---|---|
| `<C-j>` / `<C-k>` | Next / prev item |
| `<Tab>` / `<S-Tab>` | Next / prev + jump snippet placeholder |
| `<CR>` | Confirm |
| `<C-Space>` | Force open |
| `<C-b>` / `<C-f>` | Scroll docs |
| `<C-e>` | Close menu |

### Windows

| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Move between splits |
| `<C-Up/Down>` | Resize height |
| `<C-Left/Right>` | Resize width |

### Other

| Key | Action |
|---|---|
| `<leader>tt` | Theme picker |
| `gcc` | Toggle line comment |
| `gc` (visual) | Toggle selection comment |
| `<` / `>` (visual) | Indent / dedent, keep selection |
| `<C-w>` (terminal) | Word-delete passthrough to shell |

## SSH / Clipboard

Clipboard uses OSC 52 when `SSH_TTY` is set — works with kitty, wezterm, alacritty. Falls back to system clipboard (`unnamedplus`) locally.

## Server Notes

- `bin/npm` — shim that delegates Mason's npm calls to `bun`. Activated automatically when `bun` is found in PATH or `~/.bun/bin/`.
- phpactor requires `php >= 8.0` + extensions: `mbstring`, `xml`, `curl`, `tokenizer`. Install with `sudo apt install php-mbstring php-xml php-curl`.
