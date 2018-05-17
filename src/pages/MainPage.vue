<template>
  <div class='formContainer'>
    <p class="text-center">Shipments</p>
    <a href='/late'>Late Shipments</a>
    <br />
    <a href='/undelivered'>Undelivered Shipments</a>
    <form name="newOrder" action="javascript: void(0);">
      <input
        type="text"
        placeholder="Order Number"
        v-model="getFormModel.order_number"
        v-on:keyup.enter="newShipment"/>
        <br />
      <input
        type="text"
        placeholder="Vendor"
        v-model="getFormModel.vendor"
        v-on:keyup.enter="newShipment"/>
        <br />
      <input
        type="text"
        placeholder="Address"
        v-model="getFormModel.address"
        v-on:keyup.enter="newShipment"/>
        <br />
      <input
        type="text"
        placeholder="Tracking Identifier"
        v-model="getFormModel.tracking_identifier"
        v-on:keyup.enter="newShipment"/>
        <br />
    <button
      type="button"
      class="btn btn-info"
      v-on:click="newShipment">
      Add
    </button>
    </form>
    <br />
    <main-component></main-component>
  </div>
</template>

<script>
  import MainComponent from '../components/MainComponent.vue'
  import store from '../store/store'
  export default {
    components: {MainComponent},
    computed: {
        getFormModel: () => store.getters.getFormModel
    },
    methods: {
        newShipment: function() {
            store.dispatch('create_new', this.getFormModel).then((res) => {
                store.dispatch('get_all')
                store.dispatch('clear_form')
            }).catch((err) => { console.error(err) })
        }
    }
  }
</script>
