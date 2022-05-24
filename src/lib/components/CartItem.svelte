<script>
  import Counter from "./Counter.svelte";
</script>

<div class="cart-item">

  <div class="image">
    <img src="/product.jpg" alt="">
  </div>

  <div class="info">
    <div class="name">Head & Shoulders 250ML</div>
    <div class="price">Rs. 250</div>
  </div>

  <div class="counter-total">
    <Counter />
    <div class="total">Rs. 750</div>
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