<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Logout', href: '/account/logout' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title title="Logging Out.." />