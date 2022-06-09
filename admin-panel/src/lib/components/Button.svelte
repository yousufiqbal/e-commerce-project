<script>
  import Icon from "$lib/components/Icon.svelte";

  export let name, icon, href = null
  export let type = null
</script>

{#if href}
<a {href} class="button {type}">
  <Icon size="1.2rem" {icon} />
  <span>{name}</span>
</a>

{:else}
<button class="button {type}" on:click>
  <Icon size="1.2rem" {icon} />
  <span>{name}</span>
</button>
{/if}

<style>
  .button {
    display: flex;
    gap: 7px;
    padding: 6px 12px;
    border: 1px solid var(--border);
    box-shadow: var(--shadow);
    border-radius: 4px;
  }
  .button:hover {
    box-shadow: 0 0 5px 0 rgb(64, 64, 64);
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