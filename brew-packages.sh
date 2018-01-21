#!/bin/bash

brew install \
  ack \
  autoconf \
  automake \
  clang-format \
  cmake \
  cppcheck \
  cscope \
  exiftool \
  fasd \
  fzf \
  memcached \
  mysql \
  pcre \
  pssh \
  pstree \
  pyenv \
  pyenv-virtualenv \
  rbenv \
  readline \
  redis \
  ripgrep \
  s3cmd \
  the_silver_searcher \
  trash \
  vim \
  wget \
  tidy-html5 \
  libyaml \
  libtiff \
  libtool \
  freetype \
  imagemagick \
  ios-sim \
  postgresql \
  chromedriver \
  geckodriver \
  sqlite \
  libpng \
  jpeg \
  libevent \
  ansible \
  phantomjs \
  nvm

brew install --HEAD universal-ctags/universal-ctags/universal-ctags

brew tap homebrew/services
brew services start mysql
brew services start postgresql
brew services start redis
brew services start memcached

