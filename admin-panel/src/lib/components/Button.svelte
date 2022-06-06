<script>
  import Icon from "$lib/components/Icon.svelte";

  export let name, icon, href = null
  export let type = null
</script>

{#if href}
<a {href} class="button {type}">
  <Icon size="1.3rem" {icon} />
  <span>{name}</span>
</a>

{:else}
<button class="button {type}" on:click>
  <Icon size="1.3rem" {icon} />
  <span>{name}</span>
</button>
{/if}

<style>
  .button {
    display: flex;
    gap: 7px;
    padding: var(--padding);
    border: 1px solid var(--border);
    box-shadow: var(--shadow);
  }
  .primary {
    color: white;
    background-color: var(--secondary);
  }
</style>