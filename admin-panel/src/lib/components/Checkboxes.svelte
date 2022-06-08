<script>
  export let group = [ 'ordered', 'confirmed', 'dispatched', 'received', 'delivery', 'net-profit' ]
  export let items = [
    { name: 'Ordered', value: 'ordered' },
    { name: 'Confirmed', value: 'confirmed' },
    { name: 'Dispatched', value: 'dispatched' },
    { name: 'Received', value: 'received' },
    { name: 'Delivery', value: 'delivery' },
    { name: 'Net Profit', value: 'net-profit' },
  ]

  $: console.log(group)
</script>

<div class="checkboxes">

  {#each items as item}
  <div class="checkbox">
    <input id={item.value} name={item.value} value={item.value} bind:group type="checkbox">
    <label for="{item.value}">{item.name}</label>
  </div>  
  {/each}

</div>

<style>
  .checkboxes {
    display: flex;
    align-items: center;
    /* border: 1px solid red; */
    gap: 15px;
    margin-bottom: 20px;
  }
  .checkbox {
    display: flex;
    align-items: center;
    gap: 5px;
  }
</style>