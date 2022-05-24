<script>
  const Categories = [
    { name: '', url_name: '' }
  ]

  /** @type {Categories} */
  export let categories = []
</script>

<div class="categories">

  {#each categories as category}
  <a href="/categories/{category.url_name}" class="category">
    <div class="image">
      <img src="/category.jpg" alt="">
    </div>
    <div class="name">{category.name}</div>
  </a>
  {/each}

</div>

<style>
  .category {
    padding: 5px;
    border-radius: 5px;
    display: grid;
    border: 1px solid var(--border);
  }
  .image {
    justify-content: center;
    padding: 5px;
    display: flex;
  }
  .name {
    text-align: center;
    font-weight: bold;
  }
  .categories {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-bottom: 20px;
  }
</style>