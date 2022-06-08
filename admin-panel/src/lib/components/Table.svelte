<div class="wrapper">
  <table class="table">
    <slot></slot>
  </table>
</div>

<style global>
  .wrapper {
    overflow-x: auto;
    margin-bottom: 20px;
  }
  .table {
    border: 1px solid red;
    white-space: nowrap;
    border-collapse: collapse;
    margin-bottom: 10px;
  }
  .table th {
    font-weight: bold;
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
  .table .strong > td {
    /* color: green */
    padding: var(--padding-extra);
    font-weight: bold;
  }
</style>