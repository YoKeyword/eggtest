'use strict';

module.exports = appInfo => {
    const config = exports = {

        // use for cookie sign key, should change to your own and keep security
        keys: appInfo.name + '_1508302655929_4606',

        // add your config here
        middleware: [],
        view: {
            defaultViewEngine: 'nunjucks',
            mapping: {
                '.tpl': 'nunjucks',
            },
        },
        security: {
            xframe: {enable: true},
            csrf: {
                enable: true,
                useSession: false,          // if useSession set to true, the secret will keep in session instead of cookie
                ignoreJSON: true,          // skip check JSON requests if ignoreJSON set to true
                cookieName: 'csrfToken',    // csrf token's cookie name
                sessionName: 'csrfToken',   // csrf token's session name
                headerName: 'x-csrf-token', // request csrf token's name in header
                bodyName: '_csrf',          // request csrf token's name in body
                queryName: '_csrf',         // request csrf token's name in query
            },
        }
    };
    return config;

}
;
