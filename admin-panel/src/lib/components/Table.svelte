<script>
  export let width = 'auto'
</script>

<div class="wrapper">
  <table style:max-width={width} class="table">
    <slot></slot>
  </table>
</div>

<style global>
  .wrapper {
    overflow-x: auto;
    margin-bottom: 20px;
  }
  .table {
    white-space: nowrap;
    border-collapse: collapse;
    margin-bottom: 10px;
    width: 100%;
  }
  .table > tr:first-child {
    background-color: rgb(255, 247, 225);
    box-shadow: var(--shadow);
  }
  .table th {
    font-weight: bold;
  }
  .table th, .table td {
    padding: var(--padding);
    border: 0.7px solid var(--border);
  }
  .table .main {
    width: 100%;
  }
  .table a {
    color: blue;
  }
  .table .strong > td {
    /* color: green */
    /* padding: var(--padding-extra); */
    font-weight: bold;
  }
  .table .important {
    color: red;
  }
  .table a:hover {
    color: red;
  }
  tr {
    transition: background-color 200ms;
  }
  tr:hover {
    box-shadow: var(--shadow);
    background-color: rgb(255, 247, 225);
  }
</style>