import axios from 'axios'

export default (function(){
    return{
        get_all: function(){
            return axios.get('/api/shipments')
        },
        create_new: function({ order_number, vendor, tracking_identifier, address }){
            return axios.post('/api/shipments/new', {order_number, vendor, tracking_identifier, address})
        },
        get_late: function(){
            return axios.get('/api/shipments/late')
        },
        get_undelivered: function(){
            return axios.get('/api/shipments/undelivered')
        },
        get_by_vendor: function(vendor) {
            return axios.get('/api/shipments/' + encodeURIComponent(vendor))
        }
    };
})();
