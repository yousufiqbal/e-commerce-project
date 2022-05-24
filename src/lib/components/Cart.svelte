<script>
  import Counter from "./Counter.svelte";

  let Items = [
    { name: '', url_name: '', price: 0, counts: 0, stock: 0 },
  ]

  /** @type {Items} */
  export let items = []
</script>

<div class="cart">

  {#each items as item}
  <div class="cart-item">

    <a href="/products/{item.url_name}" class="image">
      <img src="/product.jpg" alt="">
    </a>
  
    <div class="info">
      <div class="name">{item.name}</div>
      <div class="price">Rs. {item.price}</div>
    </div>
  
    <div class="counter-total">
      <Counter bind:counts={item.counts} limit={item.stock} />
      <div class="total">Rs. {item.counts * item.price}</div>
    </div>
  
  </div>
  {/each}

</div>

<style>
  .cart-item {
    display: flex;
    padding-bottom: 15px;
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
    margin-right: 10px;
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
</style>