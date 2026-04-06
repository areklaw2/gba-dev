FROM devkitpro/devkitarm:20260221

# Install GBA dev packages
RUN dkp-pacman -Sy --noconfirm gba-dev
RUN apt-get update && apt-get install -y --no-install-recommends \
    clangd \
    clang-tools \
    clang-format \
    zsh \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install oh-my-zsh with eastwood theme and plugins
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="eastwood"/' ~/.zshrc \
    && sed -i 's/^plugins=.*/plugins=(zsh-autosuggestions zsh-syntax-highlighting web-search)/' ~/.zshrc \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Set environment variables
ENV DEVKITPRO=/opt/devkitpro
ENV DEVKITARM=/opt/devkitpro/devkitARM
ENV PATH=${DEVKITARM}/bin:${DEVKITPRO}/tools/bin:${PATH}
ENV SHELL=/bin/zsh

WORKDIR /src

CMD ["/bin/zsh"]
