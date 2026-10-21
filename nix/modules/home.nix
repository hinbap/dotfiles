{ config, pkgs, ... }:

{
	home.username = "doyeon";
	home.homeDirectory = "/Users/doyeon";
	home.stateVersion = "24.05";

	home.sessionPath = [
		"/Library/TeX/texbin"
	];

	# nix texlive's kpathsea defaults TEXMFHOME to ~/texmf, but the shared style
	# files (homework.sty, ...) are symlinked into ~/Library/texmf below, which is
	# only the default when using MacTeX's binaries.
	home.sessionVariables.TEXMFHOME = "${config.home.homeDirectory}/Library/texmf";

  programs.git = {
    enable = true;

		signing = {
			key = "~/.ssh/id_ed25519.pub";
			signByDefault = true;
		};

		settings = {
			user.name = "18thdimention";
			user.email = "doyeonxxxx@gmail.com";

			init.defaultBranch = "main";
			gpg.format = "ssh";

			push.autoSetupRemote = true;
			pull.rebase = false;
		};

    ignores = [
      ".DS_Store"
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      switch = "sudo darwin-rebuild switch --flake ~/dotfiles/nix";
      ll = "ls -la";
			ga = "git add .";
			ta = "tmux attach";
			z = "zoxide";
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
			{
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];

		autosuggestion.enable = true;
		initContent = ''
			export EDITOR="nvim"
			export PATH="$HOME/.local/bin:$PATH"
			export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
			export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
			# Session D-Bus for zathura SyncTeX: vimtex passes --synctex-forward,
			# which requires a reachable session bus or zathura refuses to open
			# the PDF at all. Start a per-user daemon on a fixed socket if
			# needed; no launchd, no machine-id. The minimal session.conf is
			# generated on first use because the nixpkgs default uses launchd
			# socket activation which conflicts with --address.
			if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
				export DBUS_SESSION_BUS_ADDRESS="unix:path=/tmp/dbus-doyeon.sock"
				if ! dbus-send --session --dest=org.freedesktop.DBus --type=method_call \
					--print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames \
					>/dev/null 2>&1; then
					CONF="/tmp/dbus-doyeon-session.conf"
					if [ ! -f "$CONF" ]; then
						cat > "$CONF" <<'DBUSCONF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-Bus Bus Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
<busconfig>
  <type>session</type>
  <keep_umask/>
  <listen>unix:path=/tmp/dbus-doyeon.sock</listen>
  <auth>EXTERNAL</auth>
  <standard_session_servicedirs/>
  <policy context="default">
    <allow send_destination="*" eavesdrop="true"/>
    <allow eavesdrop="true"/>
    <allow own="*"/>
  </policy>
  <limit name="max_incoming_bytes">1000000000</limit>
  <limit name="max_message_size">1000000000</limit>
</busconfig>
DBUSCONF
					fi
					rm -f /tmp/dbus-doyeon.sock
					dbus-daemon --config-file="$CONF" --fork
				fi
			fi
			if [[ -f ~/.config/zsh/.zshrc ]]; then
				source ~/.config/zsh/.zshrc
			fi
			if command -v starship &> /dev/null; then
				eval "$(starship init zsh)"
			fi
			if [ -n "''${commands[fzf-share]}" ]; then
				source "$(fzf-share)/key-bindings.zsh"
				source "$(fzf-share)/completion.zsh"
			fi
		'';
	};

	programs.bat = {
		enable = true;
		config = {
# style = "plain";
			theme = "gruvbox-dark";
		};
	};


	programs.btop = {
		enable = true;
		settings = {
			color_theme = "gruvbox_dark";
			theme_background = false;
			update_ms = 2000;
			proc_sorting = "cpu";
		};
	};

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
		colors = {
			fg = "#ebdbb2";
			bg = "#282828";
			hl = "#fabd2f";
			"fg+" = "#ebdbb2";
			"bg+" = "#3c3836";
			"hl+" = "#fabd2f";
			info = "#83a598";
			prompt = "#bdae93";
			spinner = "#fabd2f";
			pointer = "#83a598";
			marker = "#fe8019";
			header = "#665c54";
		};
	};


  home.file.".config/ghostty".source = ../config/ghostty;
  home.file.".config/aerospace".source = ../config/aerospace;
  # home.file.".config/zsh".source = ../config/zsh;
  # Live symlink so edits in ~/dotfiles/nix/config/nvim take effect without a
  # darwin-rebuild. Same reason as the TEXMFHOME symlink below.
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nix/config/nvim";
  home.file.".config/tmux".source = ../config/tmux;
	home.file.".config/starship.toml".source = ../config/starship/starship.toml;
	home.file.".config/yazi".source = ../config/yazi;
	home.file.".config/zathura".source = ../config/zathura;

	# Make shared LaTeX style files (homework.sty, macros.sty, ...) discoverable
	# from any .tex file by exposing them through TEXMFHOME (~/Library/texmf on
	# macOS/MacTeX). Uses an out-of-store symlink so the sources stay editable
	# in Catacomb/Latex/tex without rebuilding.
	home.file."Library/texmf/tex/latex/local".source =
		config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Documents/Catacomb/Latex/tex";
}
