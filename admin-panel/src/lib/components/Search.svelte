<script>
  import { onMount } from "svelte";
  import Icon from "./Icon.svelte";

  export let focused = false
  export let placeholder
  let el

  const handleShortcut = e => {
    if (e.ctrlKey && e.keyCode == 75) {
      e.preventDefault()
      el.focus()
    }
    if (e.key == 'Escape') {
      el.blur()
    }
  }

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

<svelte:window on:keydown="{handleShortcut}" />

<style>
  .search {
    display: flex;
    border: 1px solid var(--border);
    border-radius: 4px;
    /* box-shadow: var(--shadow); */
    overflow: hidden;
    margin-bottom: 20px;
    flex: 1;
  }
  button {
    padding: var(--padding);
    border-right: 1px solid var(--border);
    display: flex;
    /* color: red; */
  }
  input {
    padding: var(--padding);
    flex: 1;
  }
</style>