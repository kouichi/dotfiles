export JAVA_HOME=`/usr/libexec/java_home`
export GEM_HOME=$HOME/.gems
export ANDROID_HOME=/Applications/Android\ Studio.app/sdk

export NODE_PATH=/usr/local/lib/node_modules

export PATH=$JAVA_HOME/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$GEM_HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin/elastic-mapreduce-ruby:$PATH
export PATH=$PATH:$HOME/bin
export PATH=/usr/local/sbin:$PATH

export FIGNORE=".svn"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/kouichi/.gvm/bin/gvm-init.sh" ]] && source "/Users/kouichi/.gvm/bin/gvm-init.sh"
