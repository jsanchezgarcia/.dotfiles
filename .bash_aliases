#****** General Aliases *******#
# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#*************** Stripe ALIASES **************#

alias gopay='cd ~/stripe/pay-server;'

#FZF custom stuff

# -----------------------------------------------------------------------------
# git
# -----------------------------------------------------------------------------

# gcr - checkout git recent branch/tag
gcr() {
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

# gco - checkout git all branchs/tags
gco() {
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
