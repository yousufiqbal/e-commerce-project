<script>
  export let columns = '1fr'
</script>

<div style:grid-template-columns={columns} class="layout">
  <slot></slot>
</div>

<style>
  .layout {
    /* border: 1px solid red; */
    display: grid;
    gap: 40px;
  }
  /* .layout > div {
    border: 1px solid red;
  } */
</style>