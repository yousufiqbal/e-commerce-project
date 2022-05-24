<!-- Image, Name, Price, Button, Attractions -->

<script>
  import AddToCart from "$lib/components/AddToCart.svelte";

  export let href = '/product/head-and-shoulders'
</script>

<a {href} class="product">
  <div class="image">
    <img loading="lazy" src="/product.jpg" alt="">
  </div>
  <div class="info">
    <div class="name">Head & Shoulders 250ML</div>
    <div class="price">Rs. 250</div>
    <AddToCart />
  </div>
</a>

<style>
  .product {
    box-shadow: var(--shadow);
    display: grid;
    border: 1px solid var(--border);
    border-radius: 5px;
    overflow: hidden;
    /* border: 1px solid red; */
  }
  .image {
    padding: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .name {
    font-weight: bold;
  }
  .info {
    padding: 8px;
    /* border: 1px solid green; */
    display: grid;
    gap: 5px;
  }
  .price {
    color: green;
    margin-bottom: 5px;;
  }
</style>