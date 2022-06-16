<script context="module">
  /** @type {import('@sveltejs/kit').Load} */
  export const load = async ({ fetch, params }) => {
    const response = await fetch('/api/users/info?user_id='+params.user_id)
    const user = await response.json()
    console.log(user)
    return { props: { user }}
  }
</script>
<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Layout from "$lib/components/Layout.svelte";
  import LinkTabs from "$lib/components/LinkTabs.svelte";
import StandaloneMenu from "$lib/components/StandaloneMenu.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";
  import {  beautifyDateTime } from "$lib/others/utils";
  import { startCase } from "lodash-es";

  const tabs = [
    { name: `About`, href: `/users/${$page.params.user_id}` },
    { name: `Orders`, href: `/users/${$page.params.user_id}/orders` },
    { name: `Promos`, href: `/users/${$page.params.user_id}/promos` },
    { name: `Wallet`, href: `/users/${$page.params.user_id}/wallet` },
    { name: `Wishlist`, href: `/users/${$page.params.user_id}/wishlist` },
    { name: `Messages`, href: `/users/${$page.params.user_id}/messages` },
    { name: `Settings`, href: `/users/${$page.params.user_id}/settings` },
  ]

  export let user = {}
</script>

<Title below="{user.email}" back title="{startCase(user.name)} # {$page.params.user_id}" />

<Layout columns="1fr 5fr">
  <div>
    <StandaloneMenu type="link" items={tabs} />
  </div>
  <div>
    <slot {user}></slot>
  </div>
</Layout>