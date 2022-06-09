<script>
  import { beforeNavigate } from "$app/navigation";
  import { showDrawer } from "$lib/stores/misc";
  import Icon from "./Icon.svelte";

  let innerWidth

  beforeNavigate(() => {
    if (innerWidth < 800) return
    $showDrawer = false
  })
</script>

<svelte:window bind:innerWidth />

<div class="menu">
  <a href="/categories">
    <Icon icon="folders" />
    <span>Categories</span>
  </a>
  <a href="/brands">
    <Icon icon="priceTagThree" />
    <span>Brands</span>
  </a>
  <a href="/products">
    <Icon icon="listCheck" />
    <span>Products</span>
  </a>
  <a href="/orders">
    <Icon icon="listOrdered" />
    <span>Orders</span>
  </a>
  <a href="/users">
    <Icon icon="userThree" />
    <span>Users</span>
  </a>
  <a href="/reports">
    <Icon icon="lineChart" />
    <span>Reports</span>
  </a>
  <a href="/backups">
    <Icon icon="databaseTwo" />
    <span>Backups</span>
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
  a:hover {
    color: red;
  }
</style>