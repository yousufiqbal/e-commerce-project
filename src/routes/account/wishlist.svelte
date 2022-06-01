<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Products from "$lib/components/Products.svelte";
  import Title from "$lib/components/Title.svelte";

  export let wishlist = []

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Wishlist', href: '/account/wishlist' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Wishlist" />

<Products products={wishlist} />