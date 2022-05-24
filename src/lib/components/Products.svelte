<script>
  import AddToCart from "./AddToCart.svelte";

  export let products = [
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml' },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml' },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml' },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml' },
  ]
</script>


<div class="products">

  {#each products as product}
  <div class="product">

    <a href="/product/{product.url_name}" class="image">
      <img loading="lazy" src="/product.jpg" alt="">
    </a>

    <div class="info">
      <a href="/product/{product.url_name}" class="name">{product.name}</a>
      <div class="price">Rs. 250</div>
      <AddToCart />
    </div>

  </div>
  {/each}

</div>

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
  .products {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-bottom: 40px;
  }
</style>