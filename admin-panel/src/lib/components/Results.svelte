<script>
  import { createEventDispatcher } from "svelte";
  import Nothing from "./Nothing.svelte";
  
  const dispatch = createEventDispatcher()
  export let results = []
</script>

{#if results.length != 0}
<div class="results">

  {#each results as { id, name }}
  <button on:click={()=>dispatch('select', { id, name })} class="result">{name}</button>
  {/each}
  
</div>

{:else}
<Nothing>
  No Results.
</Nothing>
{/if}

<style>
  .results {
    display: grid;
    gap: 10px;
  }
  .result {
    border: 1px solid var(--border);
    padding: var(--padding);
  }
  .result:hover {
    color: red;
  }
</style>