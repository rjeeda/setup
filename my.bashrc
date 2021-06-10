
# -------------------------------------
# Random things recommended by Broad IT
# -------------------------------------

# Default permissions (files = rw/rw/r, folders = rwx/rwx/r-x)
umask 002

stty -ixon -ixoff

export HOSTADDR=`hostname -i`


# ------
# Dotkit
# ------

source /broad/software/scripts/useuse

if [[ ! `hostname` =~ login ]]; then
    
    reuse Google-Cloud-SDK
    
    reuse Samtools
    reuse "BLAST+"
    reuse .tcltk8.6.4
    reuse .hdf5-1.10.4
    reuse .pango-1.36.8
    
    reuse Anaconda3
    
fi

reuse -q .emacs-26.2
reuse -q default
reuse UGER
reuse -q .r-3.6.0
reuse -q Python-3.6


# ----
# Path
# ----

export CHOME="/home/unix/${USER}"
export PATH=$CHOME/bin:$CHOME/.local/bin:$CHOME/code/uger:.:$PATH


# -------------------------
# Interactive shell options
# -------------------------

if [ "${PS1:+set}" = set ]; then

        
	# ---------------
	# Custom settings
	# ---------------

	alias ls='ls --ignore-backups --color=auto'
	alias edit='emacs -nw'
	alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'
	alias ish16='ish -q interactive -l h_vmem=16g'
	alias ish32='ish -q interactive -l h_vmem=32g'
	alias ish64='ish -q interactive -l h_vmem=64g'
	PS1='[\u@\h:\w]\$ '
	
	
        # --------------
	# Broad defaults
	# --------------

        export EDITOR=emacs
	export VISUAL=$EDITOR
	export EXINIT="set ai aw sm"
	export FCINIT emacs
	export PAGER=less
	export LESS=-ce
	export MAIL=/usr/spool/mail/$USER
	export MAILCHECK=30
	export MAILFILE=$MAIL
	export PRINTER=lw

	alias	ll='ls -lg'
	alias	la='ls -A'
	alias	lla='ls -Alg'
	alias	passwd=yppasswd
	alias	sun='stty dec; stty erase \^H'
	alias	dec='stty dec'
	alias	xtitle='echo -n "]0;\!*"'
	
	
	# ------------------------------
	# Display settings for X11 plots
	# ------------------------------

	if [ ! -f ~/.qrsh.display ]; then
    	    touch ~/.qrsh.display
	fi

	display=$(echo $DISPLAY)
	if [[ $display != "" ]]; then
	    echo "export DISPLAY="$DISPLAY > ~/.qrsh.display
	fi
	source ~/.qrsh.display
fi
