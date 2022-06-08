<script>
  import { page } from "$app/stores";
  import LinkTabs from "$lib/components/LinkTabs.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
  import { startCase } from "lodash-es";

  const tabs = [
    { name: 'Orders', href: '/users/1/orders' },
    { name: 'Promos', href: '/users/1/promos' },
    { name: 'Wallet', href: '/users/1/wallet' },
    { name: 'Wishlist', href: '/users/1/wishlist' },
    { name: 'Promos', href: '/users/1/promos' },
    { name: 'Messages', href: '/users/1/messages' },
    { name: 'Settings', href: '/users/1/settings' },
  ]
</script>

<Title title="Farhan Meva # {$page.params.user_id}" />

<LinkTabs items={tabs} />

<Subtitle subtitle="{startCase($page.url.searchParams.get('tab'))}"  />

<slot></slot>