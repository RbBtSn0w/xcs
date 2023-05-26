'use strict';

var express = require('express');
var router = express.Router();

var routeModules = [
    'acl', 'agent', 'auth', 'bot', 'code_coverage', 'dashboard', 'database',
    'debug', 'device', 'file', 'health', 'integration', 'issue',
    'misc', 'notification', 'platform', 'toolchain', 'portal', 'queue', 'repository',
    'scm', 'setting', 'user', 'version', 'xcode', 'report'
];

routeModules.forEach(function (m) {
    router.use(require('./routes_' + m + '.js'));
});

module.exports = router;
