<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Orders from "$lib/components/Orders.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Orders', href: '/account/orders' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Orders" />

<Orders />