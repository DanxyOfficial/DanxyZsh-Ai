.PHONY: run

run:
	@echo "[*] Updating repository..."
	@pkg update -y || (echo "[!] Repo error, fixing..." && \
	echo "deb https://packages.termux.dev/apt/termux-main stable main" > $$PREFIX/etc/apt/sources.list && \
	pkg update -y)

	@echo "[*] Installing packages..."
	@pkg install -y zsh git curl figlet ncurses-utils ruby vim jq python-pip

	@echo "[*] Installing lolcat..."
	@gem install lolcat

	@echo "[✓] Dependencies installed"

	@echo "[*] Pulling latest version..."
	@git pull origin main

	@echo "[*] Running installer..."
	@bash install.sh
