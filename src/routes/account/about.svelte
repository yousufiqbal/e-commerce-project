<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'About', href: '/account/about' },
  ]
</script>

<Breadcrumb {crumbs} />
<Title back title="About" />