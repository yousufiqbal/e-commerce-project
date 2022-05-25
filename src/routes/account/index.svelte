<script>
  import Menu from "$lib/components/Menu.svelte";
  import Title from "$lib/components/Title.svelte";

  const links1 = [
    { name: 'Orders', icon: 'listUnordered', href: '/account/orders' },
    { name: 'Messages', icon: 'mail', href: '/account/messages' },
    { name: 'Address', icon: 'mapPin', href: '/account/address' },
    { name: 'Wishlist', icon: 'heartTwo', href: '/account/wishlist' },
    { name: 'Wallet', icon: 'walletThree', href: '/account/wallet' },
    { name: 'Promos', icon: 'ticket', href: '/account/promos' },
  ]

  const links2 = [
    { name: 'Return Policy', icon: 'arrowGoBack', href: '/account/return-policy' },
    { name: 'Customer Support', icon: 'customerService', href: '/account/customer-support' },
    { name: 'About', icon: 'information', href: '/account/about' },
  ]
  
  const links3 = [
    { name: 'Logout', icon: 'logoutBoxR', href: '/account/logout' },
  ]
</script>

<Title title="Account" />

<Menu links={links1} />
<Menu links={links2} />
<Menu --primary="gray" links={links3} />