<script>
  import Icon from "$lib/components/Icon.svelte";

  let el
  export let shortcut = null
  export let name, icon, href = null
  export let type = null

  const handleShortcut = e => {
    if (!shortcut) return
    if (shortcut == 'ctrl+enter' && e.ctrlKey && e.key == 'Enter') {
      if (el) {
        e.preventDefault()
        el.click()
      }
    }
  }
</script>

{#if href}
<a bind:this={el} {href} class="button {type}">
  <Icon size="1.2rem" {icon} />
  <span>{name}</span>
</a>

{:else}
<button bind:this={el} class="button {type}" on:click>
  <Icon size="1.2rem" {icon} />
  <span>{name}</span>
</button>
{/if}

<svelte:window on:keydown={handleShortcut} />

<style>
  .button {
    display: flex;
    gap: 7px;
    padding: 6px 12px;
    border: 1px solid var(--border);
    /* box-shadow: var(--shadow); */
    border-radius: 4px;
  }
  .button:not(.primary):hover {
    color: red;
    box-shadow: var(--shadow);
  }
  .button.primary:hover, .button.primary:hover > span {
    background-color: white;
    color: red;
  }
  .primary {
    color: white;
    background-color: var(--secondary);
  }
  .primary span {
    color: white;
  }
  span {
    white-space: nowrap;
    color: blue;
  }
  .danger {
    background-color: var(--primary);
    color: white;
  }
  .danger span {
    color: white;
  }
</style>