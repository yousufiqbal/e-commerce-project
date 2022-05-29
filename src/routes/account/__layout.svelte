<script>
  import Menu from "$lib/components/Menu.svelte";
  import Title from "$lib/components/Title.svelte";
  import Layout from "$lib/components/Layout.svelte";
import { page } from "$app/stores";

  const links1 = [
    { name: 'Orders', icon: 'listUnordered', href: '/account/orders' },
    { name: 'Messages', icon: 'mail', href: '/account/messages' },
    { name: 'Address', icon: 'mapPin', href: '/account/address' },
    { name: 'Wishlist', icon: 'heartTwo', href: '/account/wishlist' },
    { name: 'Wallet', icon: 'walletThree', href: '/account/wallet' },
    { name: 'Promos', icon: 'ticket', href: '/account/promos' },
  ]

  const links2 = [
    { name: 'Customer Support', icon: 'customerService', href: '/account/customer-support' },
    { name: 'Return Policy', icon: 'arrowGoBack', href: '/account/return-policy' },
    { name: 'About', icon: 'information', href: '/account/about' },
  ]
  
  const links3 = [
    { name: 'Logout', icon: 'logoutBoxR', href: '/account/logout' },
  ]
</script>

<div class:hide={$page.url.pathname != '/account'}>
  <Title title="Account" />
</div>

<Layout columns="2fr 5fr">  

  <div class:hide={$page.url.pathname != '/account'} slot="main">
    <Menu links={links1} />
    <Menu links={links2} />
    <Menu --primary="gray" links={links3} />
  </div>

  <div slot="related">
    <slot></slot>
  </div>

</Layout>

<style>
  @media (max-width: 500px) {
    .hide {
      display: none;
    }
  }
</style>
