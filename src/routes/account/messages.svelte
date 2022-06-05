<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Messages from "$lib/components/Messages.svelte";
  import { axios } from "$lib/others/utils";
  import { dev } from "$app/env";
  import { onMount } from "svelte";
  import { invalidate } from "$app/navigation";
import QueryTabs from "$lib/components/QueryTabs.svelte";
  
  // const getUnread = getContext('getUnread')

  onMount(() => {
    setTimeout(async () => {
      await markRead()
    }, 2000);
  })

  
  const markRead = async () => {
    await axios.put('/api/read?type=messages')
    await invalidate('/api/unread')
  }

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Messages', href: '/account/messages' },
  ]

  const tabs = [
    { name: 'All', url_name: 'all' },
    { name: 'Orders', url_name: 'orders'},
    { name: 'Promos', url_name: 'promos'},
    { name: 'Offers', url_name: 'offers'},
  ]

  export let messages = []
</script>


<Breadcrumb {crumbs} />
<Title back title="Messages" />

<QueryTabs name="type" items={tabs} />
<Messages {messages} />