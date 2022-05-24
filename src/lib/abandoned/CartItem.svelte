<script>
  import Counter from "$lib/components/Counter.svelte";

  export let price = 250
  export let counts = 1
  export let total = price * counts
</script>

<div class="cart-item">

  <div class="image">
    <img src="/product.jpg" alt="">
  </div>

  <div class="info">
    <div class="name">Head & Shoulders 250ML</div>
    <div class="price">Rs. {price}</div>
  </div>

  <div class="counter-total">
    <Counter bind:counts />
    <div class="total">Rs. {total}</div>
  </div>

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
    /* border: 1px solid blue; */
    width: 80px;
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
  .total {
    font-weight: bold;
    font-size: 1.2rem;
    justify-self: right;
  }
</style>