FROM alpine:latest
ADD . /root/.vim_runtime
RUN mv /root/.vim_runtime/Docker/tmux.conf /root/.tmux.conf
RUN mv /root/.vim_runtime/Docker/bin/* /usr/local/bin/
RUN sh /root/.vim_runtime/install_awesome_vimrc.sh
RUN apk add curl git vim zsh tmux tzdata coreutils
RUN git config --global core.pager more
RUN git clone https://github.com/seebi/dircolors-solarized.git /root/dircolors-solarized
RUN mkdir -p /root/.dir_colors && cp /root/dircolors-solarized/dircolors.256dark /root/.dir_colors
RUN rm -rf /root/dircolors-solarized
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN curl -O https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
RUN sed -i "/s*env zsh -l/d" install.sh
RUN sed -i "/s*set -e/d" install.sh
RUN sh install.sh
RUN rm -rf install.sh
RUN sed -i "$ a setopt no_nomatch" /root/.zshrc
RUN sed -i "$ a export TERM=xterm-256color" /root/.zshrc
RUN sed -i "s/ZSH_THEME=.*$/ZSH_THEME=\"tonotdo\"/g" /root/.zshrc
RUN sed -i "$ a alias tmux=\"tmux -u\"" /root/.zshrc
RUN sed -i "$ a export SHELL=/bin/zsh" /root/.zshrc
RUN sed -i "$ a eval \`dircolors /root/.dir_colors/dircolors.256dark\`" /root/.zshrc
