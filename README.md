PhantomJS Docker Image
PhantomJS http://phantomjs.org/ docker image https://hub.docker.com/r/zjgsuwk/phantomjs/
primarily created to support CasperJS docker image https://github.com/zjgsuwk/phantomjs.git

PhantomJS Version: 2.1.3
Usage
'hello world' and version check (default script)

docker run --rm zjgsuwk/phantomjs
mount your own script

docker run --rm -v `pwd`/myscript.js:/home/phantomjs/script.js zjgsuwk/phantomjs
run in REPL mode, see more details here http://phantomjs.org/repl.html

docker run -ti --rm --entrypoint="phantomjs" zjgsuwk/phantomjs
Some key points
This image contains ENTRYPOINT and will run as an executable, therefore run it with --rm option (automatically remove the container when it exits).

The image includes a sample script, which is executed by default if you don't mount your script with the -v option during docker run. It prints famous Hello, world! and PhantomJS version.

In addition, have a look at related image zjgsuwk/casperjs, which is build on top of this one. CasperJS is a testing framework tailored for PhantomJS. Personally, I use it for UA (user acceptance) testing of websites.
