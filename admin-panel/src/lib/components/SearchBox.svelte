<script>
  import Icon from "./Icon.svelte";

  export let keyword = ''
  export let placeholder = null
</script>

<div class="search-box">
  <input bind:value={keyword} spellcheck="false" autocomplete="off" {placeholder}>
  <button>
    <Icon size="1.1rem" icon="searchTwo" />
  </button>
</div>

<style>
  .search-box {
    max-width: 500px;
    display: flex;
    border: 1px solid var(--border);
    box-shadow: var(--shadow);
    margin-bottom: 20px;
    border-radius: 5px;
    overflow: hidden;
  }
  input {
    flex: 1;
    padding: var(--padding-extra);
  }
  button {
    background-color: var(--secondary);
    color: white;
    border-left: 1px solid var(--border);
    display: flex;
    padding: var(--padding-extra);
  }
  button:hover {
    background-color: rgb(58, 58, 58);
  }
</style>