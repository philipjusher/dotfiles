
#Start small
FROM ubuntu:20.04 

COPY apt_installs.sh /bin/apt_installs.sh
RUN chmod +x /bin/apt_installs.sh
RUN /bin/apt_installs.sh


ENV USER=Devbox
#Make User - alpine
#RUN adduser -D -s /bin/zsh ${USER} wheel 
RUN useradd -m -s /bin/zsh -G sudo ${USER}
RUN echo "${USER}:password" | chpasswd
# User Directory
ENV homedir=/home/${USER}
#Setting make everything in home dir 
WORKDIR ${homedir}
USER ${USER}

#ZSH
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ENV ZSH_CUSTOM=${homedir}/.oh-my-zsh
RUN git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions 
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
COPY zsh/zshrc ${homedir}/.zshrc


#TMUX CONF
COPY tmux/tmux.conf ${homedir}/.tmux.conf


#VIM Plugins
RUN curl -fLo ${homedir}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY vim/vimrc ${homedir}/.vimrc
COPY vim/coc-settings.json ${homedir}/.vim/coc-settings.json
RUN mkdir -p ${homedir}/.config/coc
RUN vim +'PlugInstall --sync' +qa
RUN vim +'CocInstall -sync coc-python' +qa

#GIT CONF
COPY git/gitconfig ${homedir}/.gitconfig

USER root

# Entrypoint Script
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
# Run an entrpoint that gives the user permision to docker socket and changes to dev box user
ENTRYPOINT ["/bin/entrypoint.sh"]



#TO DO 
# copy and paste
# Style tmux
# autocompletions (eg docker, kubectl, helm)

