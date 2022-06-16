<script context="module">
  /** @type {import('@sveltejs/kit').Load} */
  export const load = async ({ fetch, params }) => {
    const response = await fetch('/api/users/info?user_id='+params.user_id)
    const user = await response.json()
    return { props: { user }}
  }
</script>
<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import LinkTabs from "$lib/components/LinkTabs.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";
import { beautifyDate, beautifyDateTime } from "$lib/others/utils";
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

  const crumbs = [
    { name: 'Users', href: '/users', icon: 'userThree' },
    // { name: 'ID', href: '/' },
  ]

  export let user = {}
</script>

<Breadcrumb {crumbs} />
<Title back title="{startCase(user.name)} # {$page.params.user_id}" />
<Text>
  Email: {user.email}<br>
  Joined: {beautifyDateTime(user.created)}
</Text>
<LinkTabs items={tabs} />

<Subtitle subtitle="{startCase($page.url.searchParams.get('tab'))}"  />

<slot></slot>