<script>
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import Icon from "$lib/components/Icon.svelte";
  import { isSafari } from '$lib/others/utils.js'

  let input
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
    if (!keyword.trim()) {
      keyword = ''
      return
    }
    goto(`/search?keyword=${keyword}`)
  }

  const clear = () => {
    keyword = ''
    input.focus()
    goto('/search', { keepfocus: true })
  }

  const hideSuggestions = e => {
    // keyword = e.currentTarget.text
    setTimeout(() => {
      show = false
    }, 0);
  }
</script>

<div class="wrapper">

  <div class="search-box {$$props.class || 'mb20'}">
    
  <form class="search" on:submit|preventDefault={search}>

    <button><Icon size="1.3rem" icon="searchTwo" /></button>
    <input bind:this={input} bind:value={keyword} use:typeMe on:focus={()=>show=true} on:blur={hideSuggestions} {placeholder}>
    
    {#if keyword && show}
    <button on:click={clear}><Icon size="1.3rem" fill="var(--primary)" icon="arrowRight" /></button>
    {/if}
    {#if keyword && !show}
    <button on:click={clear}><Icon size="1.3rem" icon="close" /></button>
    {/if}

  </form>

  {#if show}
  <div class="suggestions">
    <a href="/search?keyword=chine-apple">Chine Apple</a>
    <a href="/search?keyword=pakistan-banana">Pakistan Banana</a>
    <a href="/search?keyword=japan-orange">Japan Orange</a>
    <a href="/search?keyword=chine-apple">Chine Apple</a>
    <a href="/search?keyword=pakistan-banana">Pakistan Banana</a>
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
    overflow: hidden;
    position: absolute;
    z-index: 1;
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
    z-index: 1;
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