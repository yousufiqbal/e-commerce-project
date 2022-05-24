<script>
  import { page } from "$app/stores";

  export let name = 'type'
  
  export let pills = [
    { name: 'Butter', url_name: 'butter' },
    { name: 'Milk', url_name: 'milk' },
    { name: 'Cheese', url_name: 'cheese' },
    { name: 'Cream', url_name: 'cream' },
    { name: 'Yogurt', url_name: 'yogurt' },
  ]

  $: current = $page.url.searchParams.get(name) || null
</script>

<div class="pills">

  {#each pills as pill}
  <a class:active={current==pill.url_name} href="?{name}={pill.url_name}" class="pill">{pill.name}</a>
  {/each}

</div>

<style>
  .pills {
    /* border: 1px solid red; */
    display: flex;
    gap: 10px;
    margin-bottom: 15px;
    overflow-x: hidden;
    padding-bottom: 10px;
  }
  .pill {
    border: 1px solid var(--border);
    padding: var(--padding);
    border-radius: 20px;
  }
  .active {
    color: var(--primary);
    border-color: var(--primary);
  }
</style>