<script>
  import { page } from "$app/stores";

  export let name = 'tab'
  export let items = []

  $: current = $page.url.searchParams.get(name) || items[0].url_name
</script>

<div class="query-tabs">

  {#each items as item}
    <a class:active={current == item.url_name} href="?{name}={item.url_name}" class="tab">{item.name}</a>
  {/each}

</div>

<style>
  .query-tabs {
    display: flex;
    margin-bottom: 25px;
    border-bottom: 1px solid var(--border);
    border-left: 1px solid var(--border);
  }
  .tab {
    white-space: nowrap;
    padding: var(--padding);
    border: 1px solid var(--border);
    border-left: none;
    border-bottom: none;
    /* color: blue; */
  }
  .active {
    color: var(--primary)
  }
</style>