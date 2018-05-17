<template>
  <div class="container">
    <div class="row">
        <br/>
        <br/>
        <ul class="list-group">
          <list-item v-for="item in getItems"
            v-bind:item="item"
            v-bind:key="item.id">
          </list-item>
        </ul>
    </div>
  </div>
</template>

<script>
  import store from '../store/store'
  import ListItem from '../components/ListItem.vue'

  export default {
    components: {ListItem: ListItem},
    data: function(){
      return {}
    },
    mounted(){
      store.dispatch('get_all')
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
