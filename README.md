# xcs

Xcode Server application Continuation of life

## Node.js with your work environment

Environments:

1. node: 12.8.0
    * How to check the xcode server nodejs version? check the file in `/Node/bin/node -v`
2. python: 2.7.16

### How to install nodejs with your work environment

1. Install environment manager tools. You can find by homebrew
    * nvm
    * pyenv
2. `nvm install 12.8.0`
3. `pyenv install 2.7.16`
4. `cd xcsd/` path
5. `npm list`, will sell the issues by ws & Node.js module, and remove it.
6. Fix the log issues(npm ERR!), `npm install bufferutil@4.0.1 utf-8-validate@5.0.2`
7. `npm update`, if you fail, check your node version and python version.
8. `npm list` try again, and fix it. Still you will see the log is clean.

## Nodejs with data dog

when you install Datadog integration with nodejs by Datadog guidelines will fail.
The reason is dd-trace need bind with xcs environment, and more nodejs run detail check the file(com.apple.xcsd.plist).

### How to install dd-trace with nodejs

1. Install dd-trace version, you need check the xcode server nodejs version, and install the same version of dd-trace.  
    * How to use the same version of dd-trace? [dd-trace Version Release Lines and Maintenance](https://github.com/DataDog/dd-trace-js#version-release-lines-and-maintenance)
2. Install dd-trace of Node.js `npm install dd-trace@2`
3. `npm list`, will sell the issues by ws & Node.js module, and remove it.
5. Flow the [Datadog Node.js Tracer](https://docs.datadoghq.com/tracing/setup/nodejs/) to install the dd-trace
