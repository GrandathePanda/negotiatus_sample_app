<template>
  <li class="list-group-item" v-bind:class="{
    'yellow': (lateness < 2.0),
    'orange': (lateness < 3.0 && lateness >= 2.0),
    'red': (lateness >= 3.0)
  }">
      <label for='order_number'>Order Number</label>
      <span name='order_number'>{{ item.order_number }}</span>
      <br/>
      <label for='address'>Shipping Address</label>
      <span name='address'>{{ item.address }}</span>
      <br/>
      <label for='vendor'>Vendor</label>
      <span name='vendor'>{{ item.name }}</span>
      <br/>
      <label for='ordered_at'>Ordered On</label>
      <span name='ordered_at'>{{ item.ordered_at }}</span>
  </li>
</template>


<script>
  import store from '../store/store'
  export default {
    props: ['item'],
    data: function(){
      return {
        lateness: parseInt(this.item.late_by) / parseInt(this.item.average_delivery_time)
      }
    },
  }
</script>
