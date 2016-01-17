FROM node

ENV REVEAL_VERSION 3.2.0
#RUN  apt-get -y install curl && \
#  curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
#  apt-get -y -q install curl nodejs npm && \
#  apt-get clean

RUN curl -L https://github.com/hakimel/reveal.js/archive/$REVEAL_VERSION.tar.gz | tar xz && ln -s /reveal.js-$REVEAL_VERSION /revealjs

RUN mkdir -p /reveal/md

WORKDIR /revealjs

RUN npm install -g grunt-cli
RUN npm install
#RUN sed -i Gruntfile.js -e 's/port: port,/port: port, hostname: "",/'
COPY index.html /revealjs/

EXPOSE 8000
VOLUME ["/revealjs/md/"]
CMD ["grunt", "serve"]
