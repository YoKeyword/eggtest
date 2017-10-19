'use strict';

module.exports = app => {
  app.get('/', 'home.index');
  app.get('/home', app.controller.home.home);
  app.post('/upload', app.controller.home.upload);
};
