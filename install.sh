#!/data/data/com.termux/files/usr/bin/bash

P='\033[1;37m'
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
C="\e[36m"
W="\e[37m"
X="\e[0m"

bannerZsh() {
echo -e "${G}
${G}╭──────────────────────────────────────────────────────────────╮${G}
${G}│${R}  ___     ____  ____   __ __  __ __      _____  _____ __ __   ${G}│
${G}│${R} |   \   /    ||    \ |  |  ||  |  |    |     |/ ___/|  |  |  ${G}│
${G}│${R} |    \ |  o  ||  _  ||  |  ||  |  |    |__/  (   \_ |  |  |  ${G}│
${G}│${R} |  D  ||     ||  |  ||_   _||  ~  |    |   __|\__  ||  _  |  ${G}│
${G}│${P} |     ||  _  ||  |  ||     ||___, | __ |  /  |/  \ ||  |  |  ${G}│
${G}│${P} |     ||  |  ||  |  ||  |  ||     ||  ||     |\    ||  |  |  ${G}│
${G}│${P} |_____||__|__||__|__||__|__||____/ |__||_____| \___||__|__|  ${G}│
${G}╰──────────────────────────────────────────────────────────────╯
"
}

info() { echo -e "${C}[*]${X} $1"; }
ok()   { echo -e "${G}[✓]${X} $1"; }
warn() { echo -e "${Y}[!]${X} $1"; }
err()  { echo -e "${R}[✗]${X} $1"; }

clear
bannerZsh
echo

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

setup_termux_ui() {
    info "Setting Termux UI..."

    mkdir -p "$HOME/.termux"

    cat > "$HOME/.termux/termux.properties" <<'EOF'
allow-external-apps = true
shortcut.create-session = ctrl + t
shortcut.next-session = ctrl + 5
shortcut.previous-session = ctrl + 4
extra-keys = [ \
 ['ESC','|','/','HOME','UP','END','PGUP','DEL'], \
 ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP'] \
]
EOF

    termux-reload-settings >/dev/null 2>&1
    ok "Termux UI applied"
}

setup_termux_ui

info "Setting up plugins..."

mkdir -p "$HOME/.zsh"

if [[ ! -d "$HOME/.zsh/zsh-autosuggestions" ]]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh/zsh-autosuggestions" >/dev/null 2>&1
    ok "zsh-autosuggestions installed"
else
    ok "zsh-autosuggestions already exist"
fi

if [[ ! -d "$HOME/.zsh/zsh-syntax-highlighting" ]]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.zsh/zsh-syntax-highlighting" >/dev/null 2>&1
    ok "zsh-syntax-highlighting installed"
else
    ok "zsh-syntax-highlighting already exist"
fi

info "Installing ASCII font..."

curl -L https://raw.githubusercontent.com/DanxyOfficial/DanxyZsh/refs/heads/DanxyZsh/.object/ASCII-Shadow.flf \
-o $PREFIX/share/figlet/ASCII-Shadow.flf >/dev/null 2>&1

chmod 644 $PREFIX/share/figlet/ASCII-Shadow.flf
ok "Font installed"

echo
bannerZsh
printf "${G} ┏━[ ${R}MASUKAN NAMA KAMU${X} ${G}]${Y}@termux${G} ~ ${R}[DanxyZsh-AI]${G}\n ┗━━❯❯❯ "

while true; do
    read -r USERNAME
    USERNAME=$(echo "$USERNAME" | tr -d ' ')
    
    if [[ -z "$USERNAME" ]]; then
        err "Nama tidak boleh kosong!"
    elif [[ ! "$USERNAME" =~ ^[a-zA-Z0-9]+$ ]]; then
        err "Hanya huruf dan angka!"
    elif [[ ${#USERNAME} -gt 5 ]]; then
        err "Maksimal 5 karakter!"
    else
        break
    fi
    printf "${G} ┗━━❯❯❯ "
done

echo "NAME=\"$USERNAME\"" > "$BASE_DIR/config/username"
ok "Username diset: $USERNAME"

info "Installing config..."

cp "$BASE_DIR/config/zshrc" "$HOME/.zshrc"
cp "$BASE_DIR/config/username" "$HOME/.username"
cp "$BASE_DIR/config/banner.sh" "$HOME/.banner"
touch "$HOME/.hushlogin"

chmod +x "$HOME/.banner"
ok "Config installed"

info "Installing AI..."

mkdir -p "$HOME/.danxy-ai"

if [[ -f "$BASE_DIR/ai.sh" ]]; then
    cp "$BASE_DIR/ai.sh" "$HOME/.danxy-ai/ai.sh"
    chmod +x "$HOME/.danxy-ai/ai.sh"
    ok "AI installed"
else
    warn "ai.sh tidak ditemukan"
fi

grep -qxF "alias ai='bash ~/.danxy-ai/ai.sh'" "$HOME/.zshrc" || \
echo "alias ai='bash ~/.danxy-ai/ai.sh'" >> "$HOME/.zshrc"

chsh -s zsh 2>/dev/null

echo
echo -e "${G}=======================================${X}"
echo -e "${G}       INSTALLATION COMPLETE ✔${X}"
echo -e "${G}=======================================${X}"
echo
echo -e "${Y}→ Jalankan: zsh${X}"
echo -e "${Y}→ AI: ai pertanyaan${X}"