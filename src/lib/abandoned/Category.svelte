<script>
  export let name = 'Grains', src = '/category.jpg'
</script>

<div class="category">
  <div class="image">
    <img {src} alt="">
  </div>
  <div class="name">{name}</div>
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
</style>