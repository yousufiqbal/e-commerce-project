<script>
import Title from "$lib/components/Title.svelte";
import Search from "$lib/components/Search.svelte";
import Breadcrumb from "$lib/components/Breadcrumb.svelte";

  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: 'Search', href: '/products/search' },
  ]
</script>

<Breadcrumb {crumbs} />
<Title title="Search Products" back="/products" />
<Search />