# PhantomJS
# http://phantomjs.org/
#
# Usage
# 'hello world' and version check (default script)
# docker run --rm zjgsuwk/phantomjs
# mount your own script
# docker run --rm -v `pwd`/myscript.js:/home/phantomjs/script.js zjguwk/phantomjs

FROM debian:jessie
MAINTAINER zjgsuwk https://github.com/zjgsuwk/phantomjs.git

ENV PHANTOMJS_VERSION=2.1.3
ENV PHANTOMJS_DIR=/home/phantomjs

RUN apt-get update -y
RUN apt-get install -y libfreetype6-dev libfontconfig1-dev wget unzip

RUN wget --no-check-certificate https://github.com/ariya/phantomjs/releases/download/${PHANTOMJS_VERSION}/phantomjs
RUN mv phantomjs /usr/local/bin/
RUN rm -rf phantom*

RUN mkdir -p $PHANTOMJS_DIR
RUN echo '"use strict"; \n\
console.log("Hello, world!"); + \n\
console.log("using PhantomJS version " + \n\
phantom.version.major + "." + \n\
phantom.version.minor + "." + \n\
phantom.version.patch); \n\
phantom.exit();' \
> ${PHANTOMJS_DIR}/script.js

WORKDIR $PHANTOMJS_DIR

ENTRYPOINT ["phantomjs", "script.js"]
