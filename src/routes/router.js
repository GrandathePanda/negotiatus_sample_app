import Vue from 'vue'
import Router from 'vue-router'
import MainPage from '../pages/MainPage.vue'
import UndeliveredPage from '../pages/UndeliveredPage.vue'
import VendorPage from '../pages/VendorPage.vue'
import LatePage from '../pages/LatePage.vue'
import ErrorPage from '../pages/ErrorPage.vue'

Vue.use(Router);

export default new Router({
    mode: 'history',
    routes: [
        {
            path: '/',
            name: 'main_page',
            component: MainPage
        },
        {
            path: '/vendor/:vendor',
            name: 'vendor_page',
            component: VendorPage
        },
        {
            path: '/late',
            name: 'late_page',
            component: LatePage
        },
        {
            path: '/undelivered',
            name: 'undelivered_page',
            component: UndeliveredPage
        },
        {
            path: '*',
            name: 'error',
            component: ErrorPage
        },
    ],
    scrollBehavior(to, from, savedPosition) {
        return {x: 0, y: 0}
    }
});
