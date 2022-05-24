<script>
import { goto } from "$app/navigation";
import { page } from "$app/stores";

  import Icon from "$lib/components/Icon.svelte";
  import { isSafari } from '$lib/others/utils.js'

  let keyword = $page.url.searchParams.get('keyword') || ''
  export let placeholder = ''
  let show = false

  const typeMe = node => {
    if (isSafari()) {
      node.type = 'text'
    } else {
      node.type = 'search'
    }
  }

  const search = () => {
    if (!keyword) {
      keyword = ''
      return
    }
    goto(`/search?keyword=${keyword}`)
  }
</script>

<div class="wrapper">

  <div class="search-box {$$props.class || 'mb20'}">
    
  <form class="search" on:submit|preventDefault={search}>
    <button><Icon size="1.3rem" icon="searchTwo" /></button>
    <input bind:value={keyword} use:typeMe on:focus={()=>show=true} on:blur={()=>show=false} {placeholder}>
    <!-- <button><Icon size="1.3rem" icon="close" /></button> -->
  </form>

  {#if show}
  <div class="suggestions">
    <a href="/">Chine Apple</a>
    <a href="/">Pakistan Banana</a>
    <a href="/">Japan Orange</a>
    <a href="/">Chine Apple</a>
    <a href="/">Pakistan Banana</a>
  </div>
  {/if}
  
</div>

</div>

<style>
  .wrapper {
    position: relative;
    margin-bottom: 70px;
  }
  .search-box {
    position: absolute;
    left: 0; right: 0;
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
    background-color: #fff;
    display: grid;
  }
  .suggestions > * {
    padding: var(--padding-extra);
    border-top: 1px solid var(--border);
  }
</style>