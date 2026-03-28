#!/data/data/com.termux/files/usr/bin/bash
cat << EOF
CREATOR: DANXY OFFICIAL × PECUT AI
SALURAN: https://whatsapp.com/channel/0029VaznZlq7z4kW00unHZ0e
WEBSITE: danxyofficial.web.id
YOUTUBE: DanxyBot
TIKTOK: Qwela.38
NB: Dilarang keras menghapus atau mengubah credit/nama creator.
Hormati hak cipta dan karya orang lain. DanxyZsh-Ai ini GRATIS,
dilarang menjual atau memperjualbelikan.
EOF


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
echo -e "${X}"

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

info "Checking repository..."
ok "ok"
fix_repo() {
    warn "Mirror error detected, switching repo..."

    mkdir -p $PREFIX/etc/apt

    cat > $PREFIX/etc/apt/sources.list <<EOF
deb https://packages.termux.dev/apt/termux-main stable main
EOF

    ok "Switched to official repository"
}


setup_termux_ui() {
    info "setting tombol key termux ui"

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

    ok "Termux UI berhasil di apply"
}


pkg update -y > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    fix_repo
    pkg update -y
fi

info "Installing dependencies..."
ok "ok"
pkg install -y zsh git curl figlet >/dev/null 2>&1
info "install ncurses-utils"
ok "ok"
pkg install ncurses-utils >/dev/null 2>&1
info "install ruby"
ok "ok"
pkg install -y ruby >/dev/null 2>&1
info "install vim"
ok "ok"
pkg install -y vim >/dev/null 2>&1
info "install lolcat"
ok "ok" 
gem install lolcat >/dev/null 2>&1
info "install jq"
ok "ok"
pkg install jq >/dev/null 2>&1
info "SELESAI INSTALL DEPENDENCIES ✓ "
ok "ok"
info "SETUP KEY TOMBOL TERMUX"
setup_termux_ui
ok "ok"
touch "$HOME/.hushlogin"
if [[ $? -ne 0 ]]; then
    err "Gagal install dependency"
    exit 1
fi

ok "Dependencies installed"

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
clear
bannerZsh
printf "${G} ┏━[ ${R}MASUKAN NAMA KAMU${NC} ${G}]${Y}@termux${G} ~ ${NC}${R}[${Y}DanxyZsh-AI${Y}${R}]${NC}${G}\n ┗━━${G}❯${Y}❯${R}❯${Y} " 


while true; do
    read -r USERNAME
    USERNAME=$(echo "$USERNAME" | tr -d ' ')
    
    if [[ -z "$USERNAME" ]]; then
        echo -e "${R}[✗]${X} Nama tidak boleh kosong!"
    elif [[ ! "$USERNAME" =~ ^[a-zA-Z0-9]+$ ]]; then
        echo -e "${R}[✗]${X} Hanya huruf dan angka yang diperbolehkan!"
    elif [[ ${#USERNAME} -gt 5 ]]; then
        echo -e "${R}[✗]${X} Nama terlalu panjang! Maksimal 5 karakter (saat ini: ${#USERNAME})"
    else
        break
    fi
    printf "${G} ┏━[ ${R}MASUKAN NAMA KAMU${NC} ${G}]${Y}@termux${G} ~ ${NC}${R}[${Y}DanxyZsh-AI${Y}${R}]${NC}${G}\n ┗━━${G}❯${Y}❯${R}❯${Y} " 
done

echo "NAME=\"$USERNAME\"" > "$BASE_DIR/config/username"

ok "Username diset: $USERNAME"

info "Installing config..."

cp "$BASE_DIR/config/zshrc" "$HOME/.zshrc"
cp "$BASE_DIR/config/username" "$HOME/.username"
cp "$BASE_DIR/config/banner.sh" "$HOME/.banner"

chmod +x "$HOME/.banner"

ok "Config installed"

info "Installing AI script..."

mkdir -p "$HOME/.danxy-ai"

if [[ -f "$BASE_DIR/ai.sh" ]]; then
    cp "$BASE_DIR/ai.sh" "$HOME/.danxy-ai/ai.sh"
    chmod +x "$HOME/.danxy-ai/ai.sh"
    ok "AI script installed"
else
    warn "ai.sh tidak ditemukan di $BASE_DIR, lewati instalasi AI"
fi

grep -qxF "alias ai='bash ~/.danxy-ai/ai.sh'" "$HOME/.zshrc" || echo "alias ai='bash ~/.danxy-ai/ai.sh'" >> "$HOME/.zshrc"
ok "Alias AI ditambahkan: ai"

info "Setting default shell..."

chsh -s zsh 2>/dev/null

ok "BERHASIL SETUP DANXY ZSH - AI"
info "TERIMAKASIH TELAH MENGGUNAKAN STYLE DANXY"
sleep 2
echo
echo -e "${G}=======================================${X}"
echo -e "${G}       INSTALLATION COMPLETE ✔${X}"
echo -e "${G}=======================================${X}"
echo
echo -e "${Y}→ Restart Termux atau jalankan: zsh${X}"
echo -e "${Y}→ Untuk AI: ai pertanyaan kamu${X}"
echo