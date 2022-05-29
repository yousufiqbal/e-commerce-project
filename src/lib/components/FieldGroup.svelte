
<script>
  export let columns = '1fr'
</script>

<div style:grid-template-columns={columns} class="field-group">
  <slot></slot>
</div>

<style>
  .field-group {
    display: grid;
    margin-bottom: 40px;
    gap: 20px;
  }
</style>