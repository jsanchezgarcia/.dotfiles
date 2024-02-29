#!/usr/bin/env bash

### BEGIN STRIPE
# All Stripe related shell configuration
# is at ~/.stripe/shellinit/bash_profile and is
# persistently managed by Chef. You shouldn't
# remove this unless you don't want to load
# Stripe specific shell configurations.
#
# Feel free to add your customizations in this
# file (~/.bash_profile) after the Stripe config
# is sourced.
if [[ -f ~/.stripe/shellinit/bash_profile ]]; then
  source ~/.stripe/shellinit/bash_profile
fi
alias enable_flag='pay exec lib/flag/scripts/set_flag_value.rb --on --flag-name'
alias disable_flag='pay exec lib/flag/scripts/set_flag_value.rb --off --flag-name'
### END STRIPE

# START - Managed by chef cookbook stripe_cpe_bin
alias tc='/usr/local/stripe/bin/test_cookbook'
alias cz='/usr/local/stripe/bin/chef-zero'
alias cookit='tc && cz'
# STOP - Managed by chef cookbook stripe_cpe_bin

### BEGIN JUANS CUSTOM STUFF ####

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



### END JUANS CUSTOM STUFF ####
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1='\u@\h \[\e[32m\]\w \[\e[91m\]$(parse_git_branch)\[\e[00m\]$ '

export GH_HOST=git.corp.stripe.com
