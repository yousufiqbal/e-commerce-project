<script>
  import Icon from "$lib/components/Icon.svelte";

  export let placeholder = ''
</script>

<div class="search-box {$$props.class || 'mb20'}">

  <div class="search">
    <button><Icon size="1.3rem" icon="searchTwo" /></button>
    <input {placeholder}>
    <button><Icon size="1.3rem" icon="close" /></button>
  </div>

  <!-- <div class="suggestions">
    <a href="/">Chine Apple</a>
    <a href="/">Pakistan Banana</a>
    <a href="/">Japan Orange</a>
    <a href="/">Chine Apple</a>
    <a href="/">Pakistan Banana</a>
  </div> -->

</div>

<style>
  .search-box {
    display: grid;
    border: 1px solid var(--border);
    border-radius: 5px;
    box-shadow: 0 0 5px 0 lightgray;
  }
  .search {
    display: flex;
    align-items: center;
  }
  .search button {
    display: flex;
    padding: 12px 13px;
  }
  input {
    flex: 1;
  }
  .suggestions {
    display: grid;
  }
  .suggestions > * {
    padding: var(--padding-extra);
    border-top: 1px solid var(--border);
  }
</style>