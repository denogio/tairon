# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs
export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.4/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.4/sbin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt/php@8.4/bin:$PATH"

systemctl --user import-environment PATH
