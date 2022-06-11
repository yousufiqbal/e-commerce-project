<script>
  import { onDestroy } from "svelte";
  import Icon from "./Icon.svelte";

  export let data = []
  export let searchColumn = 'name'
  export let placeholder = null

  let keyword = ''
  let original = [...data]

  onDestroy(() => {
    data = [...original]
  })

  const filter = () => {
    if (!keyword) {
      data = [...original]
    } else {
      data = original.filter(record => record[searchColumn].toLowerCase().includes(keyword))
    }
  }
</script>

<div class="smart-filter">
  <button>
    <Icon icon="filterTwo" />
  </button>
  <input  on:keyup={filter} bind:value={keyword} {placeholder}>
</div>

<style>
  .smart-filter {
    display: flex;
    margin-bottom: 20px;
    box-shadow: var(--shadow);
  }
  button {
    border: 1px solid var(--border);
    display: flex;
    padding: 7px 10px;
  }
  input {
    border: 1px solid var(--border);
    border-left: none;
    padding: var(--padding);
    flex: 1;
  }
</style>