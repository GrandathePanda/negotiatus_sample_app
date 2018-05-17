<template>
  <li class="list-group-item">
      <label for='order_number'>Order Number</label>
      <span name='order_number'>{{ item.order_number }}</span>
      <br/>
      <label for='address'>Shipping Address</label>
      <span name='address'>{{ item.address }}</span>
      <br/>
      <label for='delivered'>Has been delivered?</label>
      <span name='delivered'>{{ item.delivered }}</span>
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
      return {}
    },
  }
</script>
