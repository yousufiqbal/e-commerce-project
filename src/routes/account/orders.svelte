<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Orders', href: '/account/orders' },
  ]
</script>

<Breadcrumb {crumbs} />
<Title title="Orders" />