<template>
  <div>
    <p class="text-center">Shipments</p>
    <undelivered-component></undelivered-component>
  </div>
</template>

<script>
  import UndeliveredComponent from '../components/UndeliveredComponent.vue'
  export default {
    components: {UndeliveredComponent}
  }
</script>
