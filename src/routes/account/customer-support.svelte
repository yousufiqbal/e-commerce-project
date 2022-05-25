<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Customer Support', href: '/account/customer-support' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Customer Support" />