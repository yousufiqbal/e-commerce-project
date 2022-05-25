<script>
  import Label from "./Label.svelte";

  export let label, name
  export let error, touched = false
  export let items = [
    { name: 'Home', url_name: 'home' },
    { name: 'Office', url_name: 'office' },
    { name: 'Company', url_name: 'company' },
  ]

  let current = null

  const set = e => {
    current = e.currentTarget.name
  }
</script>

<div class="selector">

  <Label {label} {name} />

  <div class="options">
    {#each items as item}
    <button on:click={set} name="{item.url_name}" class:active={current==item.url_name}>{item.name}</button>
    {/each}
  </div>

  {#if touched && error}
  <div class="error">Required</div>
  {/if}

</div>


<style>
  .active {
    background-color: rgb(237, 255, 237);
    color: green;
  }
  .selector {
    display: grid;
    gap: 10px;
    margin-bottom: 20px;;
  }
  .options {
    display: flex;
    /* margin-bottom: 20px; */
    border-left: 1px solid var(--border);
  }
  button {
    border: 1px solid var(--border);
    padding: var(--padding);
    border-left: none;
  }
  .error {
    color: red;
  }
</style>