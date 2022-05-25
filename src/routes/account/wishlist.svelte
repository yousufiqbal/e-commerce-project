<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Wishlist', href: '/account/wishlist' },
  ]
</script>

<Breadcrumb {crumbs} />
<Title back title="Wishlist" />