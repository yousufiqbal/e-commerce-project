<script>
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import Icon from "$lib/components/Icon.svelte";
  import { axios, isSafari } from '$lib/others/utils.js'

  let input
  let keyword = $page.url.searchParams.get('keyword') || ''
  export let placeholder = ''
  let show = false
  let suggestions = []

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

  const suggest = async () => {
    if (keyword.length <= 2) return
    try {
      const response = await axios.get('/api/suggestions?keyword='+ keyword)
      suggestions = response.data
    } catch (error) {
      console.log(error)
    }
  }
</script>

<div class="wrapper">

  <div class="search-box {$$props.class || 'mb20'}">
    
  <form class="search" on:submit|preventDefault={search}>

    <button><Icon size="1.3rem" icon="searchTwo" /></button>
    <input on:keyup={suggest} bind:this={input} bind:value={keyword} use:typeMe on:focus={()=>show=true} on:blur={hideSuggestions} {placeholder}>
    
    {#if keyword && show}
    <button on:click={clear}><Icon size="1.3rem" fill="var(--primary)" icon="arrowRight" /></button>
    {/if}
    {#if keyword && !show}
    <button on:click={clear}><Icon size="1.3rem" icon="close" /></button>
    {/if}

  </form>

  {#if show && suggestions.length != 0}
  <div class="suggestions">
    {#each suggestions as suggestion}
    <a href="/product/{suggestion.url_name}">{suggestion.name}</a>
    {/each}
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