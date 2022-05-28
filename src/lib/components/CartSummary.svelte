<script>
  export let items = []
</script>

{#if items.length != 0}
<div class="cart-summary">
  
  <div class="left">
    <div>Total</div>
    <div>{items.length} Items</div>
  </div>

  <div class="right">
    <div>Rs. {items.map(item => item.counts * item.price).reduce((a, b) => +a + +b, 0)}</div>
    <div>All Taxes Included</div>
  </div>
  
</div>
{/if}

<style>
  .cart-summary {
    display: flex;
    justify-content: space-between;
    border-top: 1px double black;
    /* border-radius: 5px; */
    /* box-shadow: var(--shadow); */
    padding: 10px;
    margin-bottom: 20px;
  }
  .left, .right {
    color: gray;
    display: grid;
  }
  .left > :first-child {
    color: black;
    font-size: 1.3rem;
    font-weight: bold;
  }
  .right > :first-child {
    font-size: 1.3rem;
    font-weight: bold;
    color: green;
    text-align: right;  
  }
</style>