# xcs
Xcode Server application Continuation of life



## Nodejs with data dog 

when you install Datadog integration with nodejs by Datadog guidelines will fail.
The reason is dd-trace need bind with xcs environment, and more nodejs run detail check the file(com.apple.xcsd.plist).


### how to fixed.
edit the package and install by package configuration.
