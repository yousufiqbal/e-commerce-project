<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Messages from "$lib/components/Messages.svelte";
  import { axios } from "$lib/others/utils";
  import { dev } from "$app/env";
  import { getContext, onMount } from "svelte";
  
  const getUnread = getContext('getUnread')

  onMount(() => {
    setTimeout(async () => {
      await makeMessagesRead()
    }, 2000);
  })

  
  const makeMessagesRead = async () => {
    try {
      await axios.put('/api/messages/read')
      await getUnread()
    } catch (error) {
      if (dev) console.log(error)
    }
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