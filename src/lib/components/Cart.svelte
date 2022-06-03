<script>
  import AddToCart from "./AddToCart.svelte";

  export let locked = false
  export let items = []
</script>

<div class="cart">
  
  {#each items as item}
  <div class="cart-item">

    <a href="/product/{item.url_name}" class="image">
      <img src="/products/{item.url_name}.jpg" alt="">
    </a>
  
    <div class="info">
      <div class="name">{item.name}</div>
      <div class="price">Rs. {item.price}</div>
    </div>
  
    <div class="counter-total">
      {#if !locked}
      <AddToCart product={item} />
      {:else}
      <div class="counts">x {item.quantity}</div>
      {/if}
      <div class="total">Rs. {item.quantity * item.price}</div>
    </div>
    
  </div>
  {/each}
  
</div>

<style>
  .cart-item {
    display: flex;
    padding-bottom: 18px;
    border-bottom: 1px dashed var(--border);
  }
  .cart-item:last-child {
    border-bottom: none;
  }
  .image {
    display: flex;
    padding: 5px;
    box-shadow: var(--shadow);
    border-radius: 5px;
    border: 1px solid var(--border);
    width: 80px;
    margin-right: 15px;
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
    color: green;
  }
  .total {
    font-weight: bold;
    font-size: 1.2rem;
    justify-self: right;
  }
  .cart {
    display: grid;
    gap: 20px;
    margin-bottom: 20px;
  }
  .counts {
    color: red;
    font-weight: bold;
    /* border: 1px solid red; */
    justify-self: end;
  }
</style>