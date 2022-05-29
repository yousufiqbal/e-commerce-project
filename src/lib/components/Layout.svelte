<script>
  export let columns = '5fr 3fr'
</script>

<div style:grid-template-columns={columns} class="layout">

  <div class="main">
    <slot name="main"><!-- optional fallback --></slot>
  </div>

  <div class="related">
    <slot name="related"><!-- optional fallback --></slot>
  </div>

</div>

<style>
  @media (min-width: 960px) {
    .layout {
      display: grid;
      grid-template-columns: 5fr 3fr;
      gap: 40px;
    }
  }
</style>