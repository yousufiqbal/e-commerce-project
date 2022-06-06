<script>
  import Icon from "./Icon.svelte";

  export let subtitle, icon = null
</script>

<div class="subtitle">

  <div class="left">
    {#if icon}
    <Icon icon="searchTwo" />
    {/if}
    <h2>{subtitle}</h2>
  </div>

  <div class="right">
    <slot></slot>
  </div>

</div>

<style>
  .subtitle {
    display: flex;
    justify-content: space-between;
    /* border: 1px solid red; */
    align-items: center;
    margin-bottom: 20px;
  }
  .left {
    display: flex;
    gap: 10px;
  }
  h2 {
    font-family: var(--serif);
    font-size: 1.1rem;
  }
</style>