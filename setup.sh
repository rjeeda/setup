
# setup directories
mkdir ~/code/uger
mkdir /broad/hptmp/${USER}
ln -s /broad/hptmp/${USER} ~/temp
ln -s /broad/smillie-data ~/smillie-data

# copy configuration files
cp bash_profile ~/.bash_profile
cp inputrc ~/.inputrc
cp my.bashrc ~/.my.bashrc
cp tmux.conf ~/.tmux.conf
cp dir_colors ~/.dir_colors

# job submission script
cp ssub.py ~/code/uger/ssub.py
ln -s ~/code/uger/ssub.py ~/code/uger/ssub
chmod +x ~/code/uger/ssub
