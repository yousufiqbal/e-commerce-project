<script>
  import { page } from "$app/stores";
  import Icon from "./Icon.svelte";

  export let crumbs = []
</script>

{#if crumbs.length != 0}
<div class="breadcrumb">
  {#each crumbs as link, index}
  
  {#if $page.url.pathname != link.href}
  <a href="{link.href}">
    {#if link.icon}
    <Icon size="1.1rem" icon={link.icon} />
    {/if}
    <span>{link.name}</span>
  </a>
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
    display: flex;
    gap: 8px;
    color: blue;
  }
</style>