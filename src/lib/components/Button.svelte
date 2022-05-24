<script>
import Icon from "./Icon.svelte";


  export let name, href = '', icon = null
</script>

{#if href}

  <a {href} class="button">
    {#if icon}
    <Icon size="1.3rem" {icon} />
    {/if}
    <span>{name}</span>
  </a>

{:else}

  <button class="button">
    {#if icon}
    <Icon size="1.3rem" {icon} />
    {/if}
    <span>{name}</span>
  </button>

{/if}

<style>
  .button {
    border: 1px solid red;
    padding: var(--padding);
    border: var(--border);
  }
</style>