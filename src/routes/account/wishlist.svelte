<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Products from "$lib/components/Products.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Wishlist', href: '/account/wishlist' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Wishlist" />

<Products wishlist={false} />