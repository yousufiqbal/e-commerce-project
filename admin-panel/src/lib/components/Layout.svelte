<div class="layout">
  <!-- <div class="drawer"></div> -->
  <div class="main">
    <slot name="main"></slot>
  </div>
  <div class="related">
    <slot name="related"></slot>
  </div>
</div>

<style>
  .layout {
    /* border: 1px solid red; */
    display: grid;
    grid-template-columns: 5fr 2fr;
    gap: 40px;
  }
</style>