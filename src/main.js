//
// Libraries
//
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
import client from './client/client.js'
import store from './store/store.js'
import 'bootstrap';

import 'sanitize.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import './styles/custom.scss';

Vue.config.debug         = process.env.NODE_ENV == 'development'
Vue.config.devtools      = process.env.NODE_ENV == 'development'
Vue.config.productionTip = process.env.NODE_ENV == 'development'
Vue.config.silent        = process.env.NODE_ENV != 'development'

import router from './routes/router'
import {sync} from 'vuex-router-sync'
sync(store, router);

import App from './components/App.vue'

document.vueApp = new Vue({
  el: '#mainapp',
  router,
  store,
  render: function(h){ return h(App);}
});
