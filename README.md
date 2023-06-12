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

### Node.js Log Collection with Datadog

Your have two ways to collect the nodejs log.

#### Use winston with xcs

[Flow-up this guide](https://docs.datadoghq.com/logs/log_collection/nodejs/?tab=winston30)

`npm install winston@2` in xcs/xcsd/ path.

#### Use default log with xcs

Have some information by custom log format with datadog.

* [Send your logs in JSON](https://us5.datadoghq.com/logs/onboarding/server)
* [Format like winston log](https://docs.datadoghq.com/logs/log_collection/nodejs/?tab=winston20)
* [Connecting Node.js Logs and Traces](https://docs.datadoghq.com/tracing/other_telemetry/connect_logs_and_traces/nodejs/)

```log
{"level":"info","message":"Hello simple log!","timestamp":"2015-04-23T16:52:05.337Z"}
{"color":"blue","level":"info","message":"Hello log with metas","timestamp":"2015-04-23T16:52:05.339Z"}
```

### Node.js APM with Datadog

when you install Datadog integration with nodejs by Datadog guidelines will fail.
The reason is dd-trace need bind with xcs environment, and more nodejs run detail check the file(com.apple.xcsd.plist).

#### How to install dd-trace with nodejs

1. Install dd-trace version, you need check the xcode server nodejs version, and install the same version of dd-trace.  
    * How to use the same version of dd-trace? [dd-trace Version Release Lines and Maintenance](https://github.com/DataDog/dd-trace-js#version-release-lines-and-maintenance)
2. Install dd-trace of Node.js `npm install dd-trace@2`
3. `npm list`, will sell the issues by ws & Node.js module, and remove it.
4. Flow the [Datadog Node.js Tracer](https://docs.datadoghq.com/tracing/setup/nodejs/) to install the dd-trace

#### How to use dd-trace with xcs

Insert the code in the first line of your app.js

```JavaScript
// This line must come before importing any instrumented module.
const tracer = require('dd-trace').init({
    env: 'xcs-node-app-env',
    service: 'xcs-node-app-ser',
    logInjection: true
});
```

Insert the code in the last line of your worker.js

```JavaScript
// This line must come after importing any instrumented module.
const tracer = require('dd-trace').init({
    env: 'xcs-node-worker-env',
    service: 'xcs-node-worker-ser',
    logInjection: true
});
```

Upgrade logger with DataDog requirement.

Insert formatMessage function of logger.js

```JavaScript
```JavaScript
function formatMessage(level, message) {

    switch (level) {
        case 2:
            level = 'CRITICAL';
            break;
        case 3:
            level = 'ERROR';
            break;
        case 4:
            level = 'WARNING';
            break;
        case 6:
            level = 'INFO';
            break;
        case 7:
            level = 'DEBUG';
            break;
        default:
            level = 'UNKNOWN';
            break;
    }
    const time = new Date().toISOString();
    const record = { time, level, message };
    return JSON.stringify(record);
}
```

Upgrade and inset trace segment of logger.js

```JavaScript
Logger.prototype.logMessage = function (level) {
    var messageArgs = Array.prototype.slice.call(arguments, 1),
        message = messageArgs.map(logify).join(' ');
    
    // evaughan TODO: Only log warnings, errors, and critical messages (i.e. skip debug and info messages)
    if (level <= 7) {

        const jsonMessage = formatMessage(level, message);

        const tracer = global.tracer;
        const span = tracer.scope().active();
        if (span) {
            tracer.inject(span.context(), formats.LOG, jsonMessage);
        }

        console.log('%s', jsonMessage);
        
        // Log stack traces for any errors in the arguments
        messageArgs.forEach(arg => {
            if (arg && arg.stack) {
                const jsonStack = formatMessage(level, arg.stack);
                if (span) {
                    tracer.inject(span.context(), formats.LOG, jsonStack);
                }
                console.log('%s', jsonStack);
            }
        });
    }
};
```

### Upgrade Node.js version to v16

1. `nvm install 16`
2. `which node` and copy the target to `/Node/bin/node`. eg: `cp "$(which node)" "${PWD}/../Node/bin/"`.
3. remove all devDependencies in package.json, Cuz some dev module will fail to install.
4. `npm install dd-trace@4`, The last version of dd-trace is 4 is support this nodejs version.
5. `npm list` check the issues and fix it.
