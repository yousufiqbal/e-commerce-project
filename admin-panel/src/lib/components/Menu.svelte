<script>
  import Icon from "./Icon.svelte";
</script>

<div class="menu">
  <a href="/">
    <Icon fill="var(--primary)" icon="menuThree" />
    <span>Categories</span>
  </a>
  <a href="/">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Brands</span>
  </a>
  <a href="/">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Products</span>
  </a>
  <a href="/">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Orders</span>
  </a>
  <a href="/">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Reports</span>
  </a>
  <a href="/">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Activity</span>
  </a>
</div>

<style>
  .menu {
    display: grid;
  }
  a {
    display: flex;
    gap: 10px;
    padding: var(--padding);
    border-bottom: 1px solid var(--border);
  }
</style>