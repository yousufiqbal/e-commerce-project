<script>
  import Nothing from "./Nothing.svelte"

  export let categories = []
</script>

{#if categories.length != 0}
<div class="categories">
  
  {#each categories as category}
  <a href="/categories/{category.url_name}" class="category">
    <div class="image">
      <img loading="lazy" src="/category.jpg" alt="">
    </div>
    <div class="name">{category.name}</div>
  </a>
  {/each}
  
</div>

{:else}
<Nothing>
  No Categories
</Nothing>
{/if}

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
    margin-bottom: 30px;
  }
  @media (min-width: 960px) {
    .categories {
      grid-template-columns: repeat(8, 1fr);
    }
  }
</style>