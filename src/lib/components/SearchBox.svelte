<script>
  import { goto } from "$app/navigation";
  import { onMount } from 'svelte'
  import { page } from "$app/stores";
  import Icon from "$lib/components/Icon.svelte";
  import { axios, isSafari } from '$lib/others/utils.js'

  let input, mounted = false
  let keyword = $page.url.searchParams.get('keyword') || ''
  export let placeholder = ''
  let show = false
  let suggestions = []
  
  /**
   * @type {Element}
   */
  let suggestionsNode

  onMount(() => {
    mounted = true
  })

  const typeMe = node => {
    if (isSafari()) {
      node.type = 'text'
    } else {
      node.type = 'search'
    }
  }

  const search = () => {
    let active = suggestionsNode.querySelector('.active')
    // if active click it, else search
    if (active) {
      active.click()
    } else {
      if (!keyword.trim()) { keyword = ''; return }
      goto(`/search?keyword=${keyword}`)
    }
  }

  const clear = () => {
    suggestions = []
    keyword = ''
    input.focus()
    goto('/search', { keepfocus: true })
  }

  const hideSuggestions = () => {
    setTimeout(() => {
      show = false
    }, 500);
  }

  const suggest = async e => {
    if (keyword.length <= 2) {
      suggestions = []; return
    }
    try {
      const response = await axios.get('/api/suggestions?keyword=' + keyword)
      suggestions = response.data
    } catch (error) {
      console.log(error)
    }
  }

  const navigateSuggestions = e => {

    if (!suggestionsNode) return
    if (e.key  == 'ArrowDown' || e.key == 'ArrowUp') {

      let active = suggestionsNode.querySelector('.active')

      if (e.key == 'ArrowDown') {
        // check if any element has active
        // if one has active shift active to its next sibling if it has next sibling
        if (active && active.nextSibling) {
          active.classList.remove('active')
          active.nextSibling.classList.add('active')
        } else {
          // if no active element or no nextSibling.. set active to first suggestion (if it exists)
          active?.classList.remove('active')
          suggestionsNode.firstChild?.classList.add('active')
        }
      }

      if (e.key == 'ArrowUp') {
        // check if any element has active
        // if one has active shift active to its previousSibling if it has previousSibling
        if (active && active.previousSibling) {
          active.classList.remove('active')
          active.previousSibling.classList.add('active')
        } else {
          // if no active element or no previousSibling.. set active to last suggestion (if it exists)
          active?.classList.remove('active')
          suggestionsNode.lastChild?.classList.add('active')
        }

      }
    }
  }

  $: if (mounted && keyword) suggest()
</script>

<div class="wrapper">

  <div class="search-box {$$props.class || 'mb20'}">
    
  <form class="search" on:submit|preventDefault={search}>

    <button><Icon size="1.3rem" icon="searchTwo" /></button>
    <input on:keyup={navigateSuggestions} bind:this={input} bind:value={keyword} use:typeMe on:focus={()=>show=true} on:blur={hideSuggestions} {placeholder}>
    
    {#if keyword && show}
    <button on:click={search}><Icon size="1.3rem" fill="var(--primary)" icon="arrowRight" /></button>
    {/if}
    {#if keyword && !show}
    <button on:click={clear}><Icon size="1.3rem" icon="close" /></button>
    {/if}

  </form>

  {#if show && suggestions.length != 0}
  <div bind:this={suggestionsNode} class="suggestions">
    {#each suggestions as suggestion}
    <a href="/product/{suggestion.url_name}">{suggestion.name}</a>
    {/each}
  </div>
  {/if}
  
</div>

</div>

<style>
  .active {
    /* color: red; */
    background-color: rgb(245, 245, 245);
    font-weight: bold;
  }
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
  .suggestions > a {
    padding: var(--padding-extra);
    border-top: 1px solid var(--border);
  }

</style>