<script>
  import Icon from "$lib/components/Icon.svelte";

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
    text-transform: uppercase;
    box-shadow: var(--shadow);
    color: white;
    border-radius: 5px;
    display: flex;
    justify-content: center;
    gap: 10px;
    /* border: 1px solid red !important; */
    padding: var(--padding-extra);
    border: var(--border);
    background-color: rgb(0, 153, 219);
  }
</style>