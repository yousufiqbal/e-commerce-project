<script>
  import { page } from "$app/stores";

  export let name = 'type'
  export let pills = []

  $: current = $page.url.searchParams.get(name) || pills[0].url_name
</script>

{#if pills.length != 0}
<div class="pills">
  
  {#each pills as pill}
  <a class:active={current==pill.url_name} href="?{name}={pill.url_name}" class="pill">{pill.name}</a>
  {/each}
  
</div>
{/if}

<style>
  .pills {
    /* border: 1px solid red; */
    white-space: nowrap;
    display: flex;
    gap: 15px;
    margin-bottom: 15px;
    overflow-x: auto;
    padding-bottom: 10px;
  }
  .pill {
    border: 1px solid var(--border);
    padding: var(--padding);
    border-radius: 20px;
  }
  .active {
    background-color: rgb(79, 79, 79);
    color: white;
    /* border-color: var(--primary); */
  }
</style>