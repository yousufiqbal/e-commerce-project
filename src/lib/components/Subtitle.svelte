<script>
  export let subtitle
</script>

<div class="subtitle">
  <h2>{subtitle}</h2>
  <slot></slot>
</div>

<style>
  .subtitle {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 20px;
  }
  h2 {
    font-family: var(--serif);
    font-size: 1.3rem;
  }
</style>