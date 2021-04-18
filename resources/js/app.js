require('./bootstrap');
import Vue from 'vue'
import VueAxios from 'axios'
import VueRouter from 'vue-router'
import {ValidationProvider} from 'vee-validate/dist/vee-validate.full'
import {ValidationObserver} from 'vee-validate'
import App from './components/App'
import route from './module/routes'

Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);
Vue.use(VueAxios);
Vue.use(VueRouter);

const routes = route;
const router = new VueRouter({ mode: 'history', routes: routes});
const app = new Vue(
    Vue.util.extend({ router }, App)
).$mount('#app');