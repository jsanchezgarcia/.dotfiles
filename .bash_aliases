# Managing dotfiles repo
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#*************** AFT ALIASES **************#

# Go to strawberry folder and start venv
alias gostr='cd ~/strawberry; source start.sh'

# Go to chatbot fodler and start venv
alias gochat='cd ~/chatbot; source start.sh'

# Start AFT VPN
alias aftvpn='sudo openvpn --config /etc/openvpn/harvnet-vpn/openvpn-client.conf'
alias aftbbotvpn='sudo openvpn --config /etc/openvpn/bbvpn/bbvpn.conf'

# Setup software emulator
alias setup_emu='sudo ./setup/setup-v4l2loopback.sh; ./setup/setup-vcan.sh'

# Start software emulator
alias emu='EMU_PYREALSENSE2=1 python utils/emulator.py'

# Start dual software emulator
alias demu='EMU_PYREALSENSE2=1 python utils/2bot_emulator.py'

# Deploy to master and robots.
# dep_all harv3-vpn js1
dep_all ()
{
  if [ "$#" -ne 2 ]
  then
    echo "Not enough arguments. Usage: dep_all harv3-vpn js1"
  else
  ./setup/deploy.sh "$1":"$2"
  ./setup/deploy.sh "$1".bot1:"$2"
  ./setup/deploy.sh "$1".bot2:"$2"
  ./setup/deploy.sh "$1".bot3:"$2"
  ./setup/deploy.sh "$1".bot4:"$2"
  fi
}

# Deploy to master and robots using -i.
# dep_all_i harv3-vpn js1
dep_all_i ()
{
  if [ "$#" -ne 2 ]
  then
    echo "Not enough arguments. Usage: dep_all harv3-vpn js1"
  else
  ./setup/deploy.sh -i "$1":"$2"
  ./setup/deploy.sh -i "$1".bot1:"$2"
  ./setup/deploy.sh -i "$1".bot2:"$2"
  ./setup/deploy.sh -i "$1".bot3:"$2"
  ./setup/deploy.sh -i "$1".bot4:"$2"
  fi
}

#FZF custom stuff

# -----------------------------------------------------------------------------
# git
# -----------------------------------------------------------------------------

# gco - checkout git recent branch/tag
gco() {
  local branches
  local target

  branches="$(
    git recent \
      | grep -v HEAD \
      | sed 's/.* //' \
      | sed 's#remotes/[^/]*/##' \
      | sort -u \
      | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}'
  )" || return

  target="$(
    printf '%s\n%s' "$branches" \
      | fzf-tmux \
          -l40 \
          -- \
          --no-hscroll \
          --ansi \
          +m \
          -d '\t' \
          -n 2 \
          -1 \
          -q "$*"
  )" || return

  git checkout "$(echo "$target" | awk '{print $2}')"
}

# gcoa - checkout git all branchs/tags
gcoa() {
  local branches
  local target

  branches="$(
    git branch \
      | grep -v HEAD \
      | sed 's/.* //' \
      | sed 's#remotes/[^/]*/##' \
      | sort -u \
      | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}'
  )" || return

  target="$(
    printf '%s\n%s' "$branches" \
      | fzf-tmux \
          -l40 \
          -- \
          --no-hscroll \
          --ansi \
          +m \
          -d '\t' \
          -n 2 \
          -1 \
          -q "$*"
  )" || return

  git checkout "$(echo "$target" | awk '{print $2}')"
}

# gcoc - checkout git commit
gcoc() {
  local commits
  local commit

  commits="$(
    git log --pretty=oneline --abbrev-commit --reverse
  )" || return

  commit="$(
    echo "$commits" \
      | fzf --tac +s +m -e
  )" || return

  git checkout "$(echo "$commit" | sed "s/ .*//")"
}
