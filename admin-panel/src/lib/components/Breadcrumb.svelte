<script>
  import { page } from "$app/stores";

  const Crumbs = [
    { name: '', href: '' }
  ]

  /** @type {Crumbs}*/
  export let crumbs = []
</script>

{#if crumbs.length != 0}
<div class="breadcrumb">
  {#each crumbs as link, index}
  
  {#if $page.url.pathname != link.href}
  <a href="{link.href}">{link.name}</a>
  {:else}
  <div>{link.name}</div>
  {/if}
  
  {#if index < crumbs.length - 1}
  <span>&rarr;</span>
  {/if}
  
  {/each}
</div>
{/if}

<style>
  .breadcrumb {
    display: flex;
    align-items: center;
    gap: 10px;
    /* border: 1px solid red; */
    margin-bottom: 20px;
  }
  a {
    color: blue;
  }
</style>