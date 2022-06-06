<table class="table">
  <slot></slot>
</table>

<style global>
  .table {
    border: 1px solid red;
    white-space: nowrap;
    border-collapse: collapse;
    margin-bottom: 30px;
  }
  .table th, .table td {
    padding: var(--padding);
    border: 1px solid var(--border);
  }
  .table .main {
    width: 100%;
  }
  .table a {
    color: blue;
  }
</style>