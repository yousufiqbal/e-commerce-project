<script>
  export let columns = '4fr 2fr'
</script>

<div style:grid-template-columns={columns} class="layout">
  <div class="left">
    <slot name="left"></slot>
  </div>
  <div class="right">
    <slot name="right"></slot>
  </div>
</div>

<style>
  .layout {
    /* border: 1px solid red; */
    display: grid;
    grid-template-columns: 4fr 2fr;
    gap: 40px;
  }
</style>