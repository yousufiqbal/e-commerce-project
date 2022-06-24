<script>
  import { page } from "$app/stores";

  export let name = 'type'
  export let pills = []
  export let label = null

  $: current = $page.url.searchParams.get(name) || pills[0].url_name
</script>

{#if pills.length != 0}
<div class="pills">

  {#if label}
  <div class="label">{label}</div>
  {/if}  
  {#each pills as pill}
  <a class:active={current==pill.url_name} href="?{name}={pill.url_name}">{pill.name}</a>
  {/each}
  
</div>
{/if}

<style>
  .pills {
    /* border: 1px solid red; */
    white-space: nowrap;
    display: flex;
    align-items: center;
    gap: 15px;
    /* margin-bottom: 15px; */
    overflow-x: auto;
  }
  .label {
    color: red;
    /* background-color: rgb(245, 245, 245); */
    border: 1px dashed var(--border);
    padding: var(--padding-small);
    border-right: none;
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
    /* font-family: var(--serif); */
  }
  a {
    border: 1px solid var(--border);
    padding: var(--padding-small);
    border-radius: 5px;
  }
  a:not(.active):hover {
    color: red;
    box-shadow: var(--shadow);
  }
  .active {
    background-color: var(--active-bg);
    color: white;
  }
</style>