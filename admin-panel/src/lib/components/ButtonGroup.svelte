<div class="wrapper">
  <div class="button-group">
    <slot></slot>
  </div>
</div>

<style>
  .wrapper {
    overflow-x: auto;
  }
  .button-group {
    display: flex;
    column-gap: 10px;
  }
</style>