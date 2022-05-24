<script>
import { page } from "$app/stores";

  import Icon from "$lib/components/Icon.svelte";
</script>

<div class="bottom-menu">

  <a class:active={$page.url.pathname == '/'} href="/">
    <Icon size="1.3rem" icon="homeThree" />
    <span>Home</span>
  </a>
  <a class:active={$page.url.pathname == '/categories'} href="/categories">
    <Icon size="1.3rem" icon="menuFive" />
    <span>Categories</span>
  </a>
  <a class:active={$page.url.pathname == '/search'} href="/search">
    <Icon size="1.3rem" icon="searchTwo" />
    <span>Search</span>
  </a>
  <a class:active={$page.url.pathname == '/account'} href="/account">
    <Icon size="1.3rem" icon="userThree" />
    <span>Account</span>
  </a>
  <a class:active={$page.url.pathname == '/cart'} href="/cart">
    <Icon size="1.3rem" icon="shoppingCart" />
    <span>Cart</span>
  </a>

</div>

<style>
  .bottom-menu {
    background-color: #fff;
    border-top: 1px solid var(--border);
    /* border-radius: 20px; */
    display: flex;
    position: fixed;
    bottom: 0; left: 0; right: 0;
    /* border: 1px solid red; */
  }
  a {
    padding: 8px 0;
    flex: 1;
    display: grid;
    justify-items: center;
    /* border: 1px solid blue; */
  }
  .active {
    color: var(--primary);
  }
</style>