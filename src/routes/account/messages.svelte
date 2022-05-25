<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Messages from "$lib/components/Messages.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Messages', href: '/account/messages' },
  ]
</script>

<Breadcrumb {crumbs} />
<Title back title="Messages" />

<Messages />