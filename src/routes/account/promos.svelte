<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Promos', href: '/account/promos' },
  ]
</script>

<Breadcrumb {crumbs} />
<Title back title="Promos" />