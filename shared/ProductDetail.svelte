<script>
  import Carousel from "./Carousel.svelte";
  export let product = {}
</script>

<Carousel images={[`/products/${product.url_name}.jpg`]}  />

<div class="product-detail">

  {#if product.stock == 0}
    <div class="stock">Out of Stock!</div>
  {/if}
    <div class="name">{product.name}</div>
    <div class="price">Rs. {product.price}</div>
    <p class="description">{product.description}</p>

</div>

<style>
  .product-detail {
    display: grid;
    margin-bottom: 40px;
    /* border: 1px solid red; */
  }
  .name {
    font-family: var(--serif);
    font-size: 1.5rem;
  }
  .price {
    color: green;
    font-weight: bold;
    font-size: 1.2rem;
    margin-bottom: 10px;
  }
  .description {
    font-size: 1.05rem;
  }
  .stock {
    color: red;
  }
</style>