FROM alpine:latest
ADD . /root/.vim_runtime
ADD tmux.conf /root/.tmux.conf
RUN sh /root/.vim_runtime/install_awesome_vimrc.sh
RUN apk add curl git vim zsh tmux
RUN curl -O https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
RUN sed -i "/s*env zsh -l/d" install.sh
RUN sed -i "/s*set -e/d" install.sh
RUN sh install.sh
RUN rm -rf install.sh
RUN sed -i "$ a setopt no_nomatch" /root/.zshrc
RUN sed -i "$ a export TERM=xterm-256color" /root/.zshrc
RUN sed -i "s/ZSH_THEME=.*$/ZSH_THEME=\"tonotdo\"/g" /root/.zshrc
RUN sed -i "$ a alias tmux=\"tmux -u\"" /root/.zshrc
