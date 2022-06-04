<script>
  import { page, session } from "$app/stores";
  import Icon from "$lib/components/Icon.svelte";
  import { cartItemsStore } from "$lib/others/store";
  import { fly } from "svelte/transition";

  $: total = $cartItemsStore && $cartItemsStore.map(el => el.quantity).reduce((a, b) => +a + +b, 0) || 0
</script>

<div transition:fly|local={{ y: 20, duration: 200 }} class="bottom-menu">

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
    <span class="name">{$session.name?.split(' ')[0] || 'Account'}</span>
  </a>
  <a class:active={$page.url.pathname == '/cart'} href="/cart">
    <Icon size="1.3rem" icon="shoppingCart" />
    <span>Cart</span>
    {#key total}
    <div in:fly={{ y: 20, duration: 100}} class="badge">{total}</div>
    {/key}
  </a>

</div>

<style>
  .name {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 70px;
  }
  .bottom-menu {
    z-index: 2;
    background-color: #fff;
    border-top: 1px solid var(--border);
    display: flex;
    position: fixed;
    bottom: 0; left: 0; right: 0;
  }
  .badge {
    line-height: 1;
    background-color: var(--secondary);
    color: white;
    font-size: 0.8rem;
    padding: 3px;
    font-family: var(--serif);
    border-radius: 5px;
    top: -12px;
    display: flex;
    position: absolute;
  }
  a {
    position: relative;
    padding: 10px 0;
    flex: 1;
    display: grid;
    justify-items: center;
  }
  a:hover {
    color: red;
  }
  .active {
    color: var(--primary);
  }
  @media (min-width: 960px) {
    .bottom-menu {
      border-top: none;
      margin-bottom: 20px;
      position: static;
    }
    .badge {
      position: static;
      font-size: 0.9rem;
    }
    a {
      padding: 7px 20px;
      margin-right: 20px;
      border-radius: 10px;
      border: 1px solid var(--border);
      flex: 0;
      display: flex;
      align-items: center;
      gap: 10px;
      color: green;
    }
    a * {
    font-family: var(--serif);
      font-size: 1.1rem;
    }
  }
</style>