<script>
  import { beforeNavigate } from "$app/navigation";
  import { showDrawer } from "$lib/stores/misc";
  import Icon from "./Icon.svelte";

  beforeNavigate(() => {
    $showDrawer = false
  })
</script>

<div class="menu">
  <a href="/categories">
    <Icon fill="var(--primary)" icon="menuThree" />
    <span>Categories</span>
  </a>
  <a href="/brands">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Brands</span>
  </a>
  <a href="/products">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Products</span>
  </a>
  <a href="/orders">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Orders</span>
  </a>
  <a href="/users">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Users</span>
  </a>
  <a href="/reports">
    <Icon fill="var(--primary)" icon="searchTwo" />
    <span>Reports</span>
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