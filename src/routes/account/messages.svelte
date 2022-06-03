<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Messages from "$lib/components/Messages.svelte";
  import { axios } from "$lib/others/utils";
  import { dev } from "$app/env";
  import { onMount } from "svelte";
  import { invalidate } from "$app/navigation";
  
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

  export let messages = []
</script>

<Breadcrumb {crumbs} />
<Title back title="Messages" />

<Messages {messages} />