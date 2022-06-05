<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import { goto } from '$app/navigation';
  import { session } from '$app/stores';
  import { onDestroy, onMount } from 'svelte';
  import { addToast } from "$lib/others/toast";
  
  onMount(() => {
    document.cookie = "fact=;path=/;expires=Thu, 01 Jan 1970 00:00:00 GMT"
    $session.user_id = null
    $session.name = null
    goto('/')
  })
  
  onDestroy(() => {
    addToast({ message: 'You are now logged out', type: 'info' })
  })

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Logout', href: '/account/logout' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title title="Logging Out.." />