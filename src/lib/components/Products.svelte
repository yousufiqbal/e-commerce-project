<script>
  import AddToCart from "./AddToCart.svelte";
  import Icon from "./Icon.svelte";

  const Product = [{ name: '', url_name: '' }]

  export let wishlist = true

  /** @type {Product} */
  export let products = [
    // { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml' },
    // { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml' },
    // { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml' },
    // { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml' },
  ]
</script>


<div class="products">

  {#each products as product (product.product_id)}
  <div class="product">

    <a href="/product/{product.url_name}" class="image">
      <img loading="lazy" src="/products/{product.url_name}.jpg" alt="">
      {#if wishlist}
      <button>
        <Icon icon="heartTwo" size="1.5rem" />
      </button>
      {:else}
      <button>
        <Icon icon="deleteBin" size="1.5rem" />
      </button>
      {/if}
    </a>

    <div class="info">
      <a href="/product/{product.url_name}" class="name">{product.name}</a>
      {#if product.stock == 0}
      <div class="stock">Out of Stock</div>
      {/if}
      <div class="price">Rs. {product.price}</div>
      <AddToCart limit={product.fair_quantity} />
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
    position: relative;
    padding: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .image button {
    display: flex;
    position: absolute;
    top: 10px; right: 10px;
    /* border: 1px solid var(--border); */
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
  .stock {
    color: red;
  }
</style>