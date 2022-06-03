<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Orders from "$lib/components/Orders.svelte";
  import { onMount } from "svelte";
  import { axios } from "$lib/others/utils";
  import { invalidate } from "$app/navigation";
  import { dev } from "$app/env";

  export let orders = []

  onMount(() => {
    setTimeout(async () => {
      await markRead()
    }, 2000);
  })

  const markRead = async () => {
    await axios.put('/api/read?type=orders')
    await invalidate('/api/unread')
  }

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Orders', href: '/account/orders' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Orders" />

<Orders {orders} />