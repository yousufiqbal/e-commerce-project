<table class="table">
  <slot></slot>
</table>

<style global>
  .table {
    width: 100%;
    border-collapse: collapse;
  }
  .table th, .table td {
    padding: var(--padding-extra);
  }
  .table tr:nth-child(even) {
    background-color: rgb(233, 233, 233);
  }
</style>