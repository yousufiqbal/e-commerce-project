<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Pills from "$lib/components/Pills.svelte";
  import Products from "$lib/components/Products.svelte";
  import Title from "$lib/components/Title.svelte";
  import { startCase } from 'lodash-es'

  export let subcategories = []
  export let products = []

  const crumbs = [
    { name: 'Categories', href: '/categories' },
    { name: startCase($page.params.url_name), href: '/categories/'+ $page.params.url_name },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back="/categories" title="{startCase($page.params.url_name)}" />

<Pills name="type" pills={subcategories} />

<Products {products} />