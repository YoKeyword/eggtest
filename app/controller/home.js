'use strict';

module.exports = app => {
    class HomeController extends app.Controller {
        * index() {
            this.ctx.body = 'hi, egg';
        }

        *home() {
            yield this.ctx.render('home.tpl');
        }

        *upload() {
            this.ctx.body = {success: true}
        }
    }
    return HomeController;
};
