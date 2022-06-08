<script>
  import { page } from "$app/stores";
  import QueryTabs from "$lib/components/QueryTabs.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
  import { startCase } from "lodash-es";

  const tabs = [
    { name: 'Orders', url_name: 'orders' },
    { name: 'Promos', url_name: 'promos' },
    { name: 'Wallet', url_name: 'wallet' },
    { name: 'Wistlist', url_name: 'Wistlist' },
    { name: 'Promos', url_name: 'Promos' },
    { name: 'Messages', url_name: 'Messages' },
    { name: 'Settings', url_name: 'settings' },
  ]
</script>

<Title title="Farhan Meva # {$page.params.user_id}" />

<QueryTabs items={tabs} />

<Subtitle subtitle="{startCase($page.url.searchParams.get('tab'))}"  />

<slot></slot>