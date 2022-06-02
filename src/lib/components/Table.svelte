<table class="table">
  <slot></slot>
</table>

<style global>
  .table {
    white-space: nowrap;
    width: 100%;
    border-collapse: collapse;
  }
  .table th, .table td {
    padding: var(--padding-extra);
  }
  .table tr:nth-child(even) {
    background-color: rgb(241, 241, 241);
  }
</style>