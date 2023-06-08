# xcs

Xcode Server application Continuation of life

## Node.js with your work environment

1. Install environment manager tools. You can find by homebrew
    * nvm
    * pyenv
2. `nvm install 10.17.0`
3. `pyenv install 2.7.16`
4. `cd xcsd/` path
5. `npm list`, will sell the issues by ws & Node.js module, and remove it.
6. devDependencies not support current nodejs version, and current environment code, remove it.
7. The bindings module by dependencies from package.json is not use anymore by code, remove it.
8. `npm update`, if you fail, check your node version and python version.
9. `npm list` try again, and fix it. Still you will see the log is clean.

## Nodejs with data dog 

when you install Datadog integration with nodejs by Datadog guidelines will fail.
The reason is dd-trace need bind with xcs environment, and more nodejs run detail check the file(com.apple.xcsd.plist).


### how to fixed.
edit the package and install by package configuration.
