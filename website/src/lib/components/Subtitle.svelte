<script>
  import Icon from "./Icon.svelte";

  export let subtitle, icon = null
</script>

<div class="subtitle">
  <div class="group">
    {#if icon}
    <Icon fill="var(--primary)" size="1.2rem" {icon} />
    {/if}
    <h2>{subtitle}</h2>
  </div>
  <slot></slot>
</div>

<style>
  .subtitle {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 20px;
  }
  .group {
    /* border: 1px solid red; */
    display: flex;
    align-items: center;
    gap: 10px;
  }
  h2 {
    font-family: var(--serif);
    font-size: 1.3rem;
  }
</style>