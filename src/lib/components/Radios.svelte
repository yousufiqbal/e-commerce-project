<script>
  export let value = ''
  export let items = []
  export let error = ''
</script>

{#if items.length != 0}
<div class="wrapper">

  <div class="radios">
    {#each items as item}
    <div class="radio">
      <input bind:group={value} type="radio" name={item.url_name} id={item.url_name} value={item.url_name}>
      <label for="{item.url_name}">{item.name}</label>
    </div>
    {/each}
  </div>

  {#if error}
  <div class="error">{error}</div>
  {/if}
  
</div>
{/if}

<style>
  .radios {
    display: flex;
    /* border: 1px solid red; */
    gap: 15px;
    align-items: center;
  }
  .radio {
    display: flex;
    align-items: center;
    gap: 7px;
  }
  .error {
    text-transform: capitalize;
    color: red;
    padding-top: 7px;
    /* padding: 7px 15px 0 15px; */
    /* padding: var(--padding); */
  }
</style>