<script>
  import { page } from "$app/stores";
  import { setQuery } from "$lib/others/utils";

  export let name = 'tab'
  export let items = []
  export let type

  $: current = $page.url.searchParams.get(name) || items[0]?.url_name || null
</script>

<div class="tabs">
  {#each items as item}
  
    {#if type == 'query'}
    <a class:active={current == item.url_name} href="{setQuery({ [name]: item.url_name }, $page)}">{item.name}</a>
    {/if}

    {#if type == 'link'}
    <a class:active={$page.url.pathname == item.href} href="{item.href}">{item.name}</a>
    {/if}

  {/each}
</div>

<style>
  .active {
    color: white;
    background-color: var(--active-bg);
  }
  .tabs {
    display: flex;
    border-bottom: 1px solid var(--border);
    margin-bottom: 20px;
    overflow-x: auto;
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