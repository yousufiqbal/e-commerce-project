<script>
  import Title from "$lib/components/Title.svelte";
  import Search from "$lib/components/Search.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Table from "$lib/components/Table.svelte";
  import Nothing from "$lib/components/Nothing.svelte";

  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: 'Search', href: '/products/search' },
  ]

  export let products = []
</script>

<Breadcrumb {crumbs} />
<Title title="Search Products" back="/products" />
<Search placeholder="Enter Product Name / SKU" focused />

{#if products.length != 0}
<Table>

</Table>
{:else}
<Nothing>
  No Products
</Nothing>
{/if}