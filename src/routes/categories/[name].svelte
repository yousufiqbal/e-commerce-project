<script>
  import { page } from "$app/stores";
import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Pills from "$lib/components/Pills.svelte";
import Products from "$lib/components/Products.svelte";
  import Title from "$lib/components/Title.svelte";
  import { startCase } from 'lodash-es'

  const crumbs = [
    { name: 'Categories', href: '/categories' },
    { name: startCase($page.params.name), href: '/categories/'+ $page.params.name },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back="/categories" title="{startCase($page.params.name)}" />

<Pills />

<Products />