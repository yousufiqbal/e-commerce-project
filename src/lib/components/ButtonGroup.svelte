<script>
  export let columns = '1fr'
</script>

<div style:grid-template-columns={columns} class="button-group">
  <slot></slot>
</div>

<style>
  .button-group {
    position: fixed;
    display: grid;
    bottom: 75px;
    left: 0; right: 0;
    padding: 0 20px;
  }
</style>