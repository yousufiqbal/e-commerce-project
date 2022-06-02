<script>
  import { dev } from "$app/env";
  import { invalidate } from "$app/navigation";
  import { page } from "$app/stores";
  import { axios } from "$lib/others/utils";
  import AddToCart from "./AddToCart.svelte";
  import Icon from "./Icon.svelte";
  import Nothing from "./Nothing.svelte";

  const Product = [{ name: '', url_name: '' }]

  /** @type {Product} */
  export let products = []

  const addToWishlist = async product_id => {
    try {
      await axios.post('/api/wishlists?product_id=' + product_id)
      await invalidate($page.url.pathname)
    } catch (error) {
      if (dev) console.log(error)
    }
  }
  
  const removeFromWishlist = async product_id => {
    try {
      axios.delete('/api/wishlists?product_id=' + product_id)
      await invalidate($page.url.pathname)
    } catch (error) {
      if (dev) console.log(error)
    }
  }
</script>

{#if products.length != 0}
<div class="products">
  
  {#each products as product (product.product_id)}
  <div class="product">
    
    <a href="/product/{product.url_name}" class="image">
      <img loading="lazy" src="/products/{product.url_name}.jpg" alt="">
    </a>
    {#if product.wishlist_id}
    <button on:click={()=>removeFromWishlist(product.product_id)} class="heart">
      <Icon icon="deleteBin" size="1.5rem" />
    </button>
    {:else}
    <button on:click={()=>addToWishlist(product.product_id)} class="heart">
      <Icon icon="heartTwo" size="1.5rem" />
    </button>
    {/if}
    
    <div class="info">
      {#if product.stock == 0}
      <div class="stock">Out of Stock</div>
      {/if}
      <a href="/product/{product.url_name}" class="name">{product.name}</a>
      <div class="price">Rs. {product.price}</div>
      <AddToCart {product} />
    </div>
    
  </div>
  {/each}
  
</div>
{:else}
<Nothing>
  No Products
</Nothing>
{/if}

<style>
  .heart {
    display: flex;
    position: absolute;
    background-color: #fff;
    /* border: 1px solid red; */
    top: 10px; right: 10px;
  }
  .heart:hover {
    color: red;
  }
  .product {
    position: relative;
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
    align-items: end;
    gap: 5px;
  }
  .price {
    color: green;
    margin-bottom: 5px;;
  }
  .stock {
    color: red;
  }
  .products {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-bottom: 40px;
  }
  @media (min-width: 1000px) {
    .products {
      grid-template-columns: repeat(5, 1fr);
    }
  }
</style>