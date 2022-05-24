<div class="product-group">
  <slot></slot>
</div>

<style>
  .product-group {
    /* border: 1px solid red; */
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
  }
</style>