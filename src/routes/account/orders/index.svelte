<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Orders from "$lib/components/Orders.svelte";
import { onMount } from "svelte";
import { axios } from "$lib/others/utils";
import { invalidate } from "$app/navigation";
import { dev } from "$app/env";

  onMount(() => {
    setTimeout(async () => {
      await markRead()
    }, 2000);
  })

  
  const markRead = async () => {
    try {
      await axios.put('/api/read?type=messages')
      await invalidate('/api/unread')
    } catch (error) {
      if (dev) console.log(error)
    }
  }

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Orders', href: '/account/orders' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Orders" />

<Orders />