<script>
  import { page } from "$app/stores";

  export let name = 'tab'
  export let items = [
    { name: 'All', url_name: 'all' },
    { name: 'Available', url_name: 'available' },
    { name: 'Consumed', url_name: 'consumed' },
  ]

  $: current = $page.url.searchParams.get(name) || items[0]?.url_name || null
</script>

<div class="query-tabs">
  {#each items as item}
  <a class:active={current == item.url_name} href="?{name}={item.url_name}" class="tab">{item.name}</a>
  {/each}
</div>

<style>
  .active {
    color: rgb(234, 0, 0);
  }
  .query-tabs {
    display: flex;
    border-bottom: 1px solid var(--border);
    margin-bottom: 20px;
  }
  a {
    padding: var(--padding);
    border-top: 1px solid var(--border);
    border-right: 1px solid var(--border);
  }
  a:last-child {
    border-top-right-radius: 5px;
  }
</style>