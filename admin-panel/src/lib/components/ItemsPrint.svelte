<script>
  import Nothing from "./Nothing.svelte";

  export let items = []
</script>

{#if items.length != 0}
<div class="cart">
  
  {#each items as item}
  <div class="cart-item">

    <div class="info">
      <div class="name">{item.name}</div>
      <div class="price">Rs. {item.price}</div>
    </div>
    
    <div class="counter-total">
      <div class="counts">x {item.quantity}</div>
      <div class="total">Rs. {item.quantity * item.price}</div>
    </div>
    
  </div>
  {/each}
  
</div>
{:else}
<Nothing>
  No items in cart
</Nothing>
{/if}

<style>
  .cart-item {
    display: flex;
    padding-bottom: 10px;
    border-bottom: 1px solid var(--border);
  }
  .cart-item:last-child {
    border-bottom: none;
  }
  .info {
    flex: 1;
    /* border: 1px solid red; */
    display: grid;
    align-content: space-between;
  }
  .counter-total {
    display: grid;
    align-content: space-between;
    /* border: 1px solid green; */
  }
  .price {
    color: black;
  }
  .total {
    font-weight: bold;
    font-size: 1.2rem;
    justify-self: right;
  }
  .cart {
    display: grid;
    gap: 10px;
    margin-bottom: 20px;
    /* margin-bottom: 10px; */
  }
  .counts {
    color: black;
    font-weight: bold;
    /* border: 1px solid red; */
    justify-self: end;
  }
</style>