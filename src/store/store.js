import Vue from 'vue'
import Vuex from 'vuex'
import client from './../client/client.js'
Vue.use(Vuex);

const state = {
    items: [],
    newShipmentForm: {
        order_number: null,
        address: null,
        vendor: null,
        tracking_identifier: null
    }
};

const actions = {
    get_all(context) {
        let _this = this
        client.get_all()
            .then(function(response) {
                _this.commit('load_items', response.data)
            })
            .catch(function(error) {
                console.error(error)
            })
    },

    create_new(context, params) {
        return client.create_new(params).catch((err) => {
            console.error(err)
        })
    },
    get_late(context) {
        let _this = this
        return client.get_late().then((response) => {
            _this.commit('load_items', response.data)
        }).catch((err) => {
            console.error(err)
        })
    },
    get_undelivered(context) {
        let _this = this
        return client.get_undelivered().then((response) => {
            _this.commit('load_items', response.data)
        }).catch((err) => {
            console.error(err)
        })
    },
    get_by_vendor(context, vendor) {
        let _this = this
        return client.get_by_vendor(vendor).then((response) => {
            _this.commit('load_items', response.data)
        }).catch((err) => {
            console.error(err)
        })
    },
    clear_form(context){
        context.commit('clear_form')
    }
};


const mutations = {
    load_items (context, data){
        context.items = data.items
    },
    clear_form(context) {
        context.newShipmentForm = {
            order_number: null,
            address: null,
            vendor: null,
            tracking_identifier: null
        }
    }
};

const getters = {
    getItems (state){
        return state.items
    },
    getFormModel(state) {
        return state.newShipmentForm
    }
};

export default new Vuex.Store({
    state: state,
    actions: actions,
    mutations: mutations,
    getters: getters
});

