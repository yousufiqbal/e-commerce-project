<script>
  import AddToCart from "./AddToCart.svelte";
  import ButtonGroup from "./ButtonGroup.svelte";
  import Carousel from "./Carousel.svelte";
</script>

<Carousel />

<div class="product-detail">

    <div class="name">Head & Shoulders 250ML</div>
    <div class="price">Rs. 250</div>
    <p class="description">Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.</p>

</div>

<ButtonGroup>
  <AddToCart />
</ButtonGroup>

<style>
  .product-detail {
    display: grid;
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
</style>