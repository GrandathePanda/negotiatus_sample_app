<template>
  <div class="container">
  <br/>
  <br/>
    <div class="row">
        <ul class="list-group">
          <late-item v-for="item in getItems"
            v-bind:item="item"
            v-bind:key="item.id">
          </late-item>
        </ul>
    </div>
  </div>
</template>

<script>
  import store from '../store/store'
  import LateItem from '../components/LateItem.vue'

  export default {
    components: {LateItem: LateItem},
    data: function(){
      return {}
    },
    mounted(){
      store.dispatch('get_late')
    },
    computed: {
      getItems: function(){
        return store.getters.getItems
      }
    },
    methods: {
    }
  }
</script>
