<div class="category-group">
  <slot></slot>
</div>

<style>
  .category-group {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-bottom: 20px;
  }
</style>