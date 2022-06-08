<script>
  import Icon from "./Icon.svelte";

  export let keyword = ''
  export let placeholder = null
</script>

<div class="search-box">
  <input bind:value={keyword} spellcheck="false" autocomplete="off" {placeholder}>
  <button>
    <Icon icon="searchTwo" />
  </button>
</div>

<style>
  .search-box {
    display: flex;
    border: 1px solid var(--border);
    box-shadow: var(--shadow);
    margin-bottom: 20px;
  }
  input {
    flex: 1;
    padding: var(--padding);
  }
  button {
    border-left: 1px solid var(--border);
    display: flex;
    padding: var(--padding);
  }
  button:hover {
    color: red;
  }
</style>