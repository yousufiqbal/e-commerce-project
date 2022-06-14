<script>
  import { onMount } from "svelte";
  import Icon from "./Icon.svelte";

  export let focused = false
  export let placeholder
  let el

  onMount(() => {
    if (focused) el.focus()
  })
</script>

<div class="search">
  <button>
    <Icon icon="searchTwo" />
  </button>
  <input bind:this={el} on:keyup {placeholder} >
</div>

<style>
  .search {
    display: flex;
    border: 1px solid var(--border);
    border-radius: 5px;
    box-shadow: var(--shadow);
    overflow: hidden;
    margin-bottom: 20px;
  }
  button {
    padding: 10px;
    border-right: 1px solid var(--border);
    display: flex;
    color: red;
  }
  input {
    padding: 10px 18px;
    flex: 1;
  }
</style>