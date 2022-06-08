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
    /* flex-wrap: wrap; */
    gap: 10px;
    margin-bottom: 20px;
  }
</style>