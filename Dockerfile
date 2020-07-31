################################################################################
# dotfiles-base
################################################################################

FROM alpine:edge AS dotfiles-base

# set timezone
ENV TZ America/Denver
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apk add tzdata && \
    cp /usr/share/zoneinfo/America/Denver /etc/localtime && \
    echo 'America/Denver' > /etc/timezone && \
    apk del tzdata


################################################################################
# dotfiles-python-base - avoid rebuilds of python when updating build image
################################################################################

FROM dotfiles-base:latest as dotfiles-python-base

# install managed dependencies
RUN apk update && \
    apk upgrade && \
    apk --no-cache add ca-certificates && \
    apk --no-cache add \
        bzip2-dev \
        coreutils \
        dpkg \
        dpkg-dev \
        expat-dev \
        findutils \
        gcc \
        gdbm-dev \
        libc-dev \
        libffi-dev \
        libnsl-dev \
        libressl-dev \
        libtirpc-dev \
        linux-headers \
        make \
        musl-dev \
        ncurses-dev \
        pax-utils \
        readline-dev \
        sqlite-dev \
        util-linux-dev \
        xz-dev \
        zlib-dev

WORKDIR /tmp

# download python
RUN wget https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tgz && \
    tar xzf Python-3.8.2.tgz

WORKDIR /tmp/Python-3.8.2

# compile and install python
RUN ./configure --enable-optimizations --enable-shared --with-system-expat --prefix=/opt/python-3.8 && \
    make -j8 && make install

WORKDIR /tmp

RUN rm -rf Python-3.8*

################################################################################
# dotfiles-build
################################################################################

FROM dotfiles-base:latest as dotfiles-build

RUN echo '/lib:/usr/local/lib:/usr/lib' > /etc/ld-musl-x86_64.path

# install managed dependencies
RUN apk update && \
    apk upgrade && \
    apk --no-cache add ca-certificates && \
    apk --no-cache add \
        autoconf \
        automake \
        bzip2-dev \
        coreutils \
        clang \
        clang-extra-tools \
        cmake  \
        doxygen \
        dpkg \
        dpkg-dev \
        expat-dev \
        file \
        findutils \
        g++ \
        gcc \
        gdb \
        gdbm-dev \
        git \
        libc-dev \
        libffi-dev \
        libnsl-dev \
        libressl-dev \
        libtirpc-dev \
        libtool \
        linux-headers \
        llvm9 \
        llvm9-dev \
        make \
        musl-dev \
        ncurses-dev \
        pax-utils \
        readline-dev \
        sqlite-dev \
        util-linux-dev \
        xz-dev \
        zlib-dev

# install python
COPY --from=dotfiles-python-base /opt/python-3.8 /opt/python-3.8

RUN echo '/opt/python-3.8/lib' >> /etc/ld-musl-x86_64.path

RUN ln -s /opt/python-3.8/bin/python3.8 /usr/local/bin/python && \
    update-alternatives --install /usr/local/bin/python python /opt/python-3.8/bin/python3.8 0 && \
    update-alternatives --install /usr/local/bin/pip pip /opt/python-3.8/bin/pip3.8 0 && \
    update-alternatives --install /usr/local/bin/pydoc pydoc /opt/python-3.8/bin/pydoc3.8 0 && \
    update-alternatives --install /usr/local/bin/python-config python-config /opt/python-3.8/bin/python3.8-config 0 && \
    update-alternatives --install /usr/local/bin/easy_install easy_install /opt/python-3.8/bin/easy_install-3.8 0 && \
    pip install --upgrade pip && \
    pip install virtualenv

WORKDIR /root

################################################################################
# dotfiles-dev
################################################################################

FROM dotfiles-build:latest AS dotfiles-dev

# install managed dependencies
RUN apk --no-cache add \
        autoconf \
        automake \
        bash \
        busybox-extras \
        curl \
        docker \
        docker-compose \
        cmake-doc \
        gcc-doc \
        grep \
        mandoc \
        man-pages \
        mandoc-apropos \
        less \
        less-doc \
        libtool \
        node-current \
        openssh-client \
        openrc \
        tmux \
        yarn \
        zsh

RUN rc-update add docker boot

ENV TERM xterm-256color
ENV SHELL /bin/zsh
ENV PAGER less

WORKDIR /tmp

# compile and install vim against python
RUN git clone --depth 1 https://github.com/vim/vim.git

WORKDIR /tmp/vim

RUN ./configure \
      --with-features=huge \
      --enable-multibyte \
      --enable-cscope \
      --with-tlib=ncurses \
      --enable-python3interp \
      --with-python3-config-dir=/opt/python-3.8/lib/python3.8/config-3.8-x86_64-linux-gnu \
      --with-python3-command=/opt/python-3.8/bin/python3.8 && \
    make -j8 && make install

WORKDIR /tmp

RUN rm -rf vim

WORKDIR /root

# set mutable partitions
VOLUME /root

# set entry
ENTRYPOINT ["/sbin/init", "--"]
