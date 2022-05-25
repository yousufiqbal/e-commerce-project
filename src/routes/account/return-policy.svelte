<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Return Policy', href: '/account/return-policy' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Return Policy" />