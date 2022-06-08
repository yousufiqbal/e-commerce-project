<script>
  import { page } from "$app/stores";

  export let items = []
</script>

<div class="query-tabs">
  {#each items as item}
  <a class:active={$page.url.pathname == item.href} href="{item.href}" class="tab">{item.name}</a>
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