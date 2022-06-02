<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Promos from "$lib/components/Promos.svelte";
  import QueryTabs from "$lib/components/QueryTabs.svelte";
  import { onMount } from "svelte";
  import { axios } from "$lib/others/utils";
  import { invalidate } from "$app/navigation";
  import { dev } from "$app/env";

  export let promos = []

  onMount(() => {
    setTimeout(async () => {
      await markRead()
    }, 2000);
  })
  
  const markRead = async () => {
    try {
      await axios.put('/api/read?type=promos')
      await invalidate('/api/unread')
    } catch (error) {
      if (dev) console.log(error)
    }
  }

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Promos', href: '/account/promos' },
  ]

  const items = [
    { name: 'Available', url_name: 'valid' },
    { name: 'Consumed', url_name: 'invalid' },
    { name: 'Expired', url_name: 'invalid' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Promos" />

<QueryTabs {items} />

<Promos {promos} />