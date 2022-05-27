<script>
  import Icon from "./Icon.svelte";

  export let name, href, icon, type = 'general'
</script>

{#if href}

  <a {href} class="button {type}">
    {#if icon}
    <Icon size="1.2rem" {icon} />
    {/if}
    <span>{name}</span>
  </a>

{:else}

  <button on:click class="button {type}">
    {#if icon}
    <Icon size="1.2rem" {icon} />
    {/if}
    <span>{name}</span>
  </button>

{/if}

<style>
  .button {
    border-radius: 5px;
    display: flex;
    gap: 5px;
    border: 1px solid var(--border);
    padding: 5px 10px;
    color: blue;
  }
</style>