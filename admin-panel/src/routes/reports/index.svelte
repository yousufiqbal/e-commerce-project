<script>
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Reports" />

<div class="wrapper">
  <div class="links">
    <a href="/reports/profit-and-loss">Profit & Loss</a>
    <a href="/reports/user-registrations">Users Registration</a>
    <a href="/reports/orders-and-statuses">Orders & Statuses</a>
  </div>
</div>

<style>
  .links {
    display: inline-grid;
    gap: 8px;;
  }
  a {
    color: blue;
  }
  a:hover {
    color: red;
  }
</style>