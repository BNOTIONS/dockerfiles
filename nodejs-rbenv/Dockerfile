FROM dockerfile/nodejs

RUN apt-get update
RUN apt-get install -qqy build-essential libssl-dev zlib1g-dev
RUN apt-get clean

RUN curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash

ENV PATH ~/.rbenv/shims:~/.rbenv/bin:$PATH

RUN ~/.rbenv/bin/rbenv install 1.9.3-p547
RUN ~/.rbenv/bin/rbenv global 1.9.3-p547

RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
