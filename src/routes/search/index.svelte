<script>
  import { page } from "$app/stores";
  import Products from "$lib/components/Products.svelte";
  import SearchBox from "$lib/components/SearchBox.svelte";
  import Seo from "$lib/components/Seo.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";

  export let results = []
  $: keyword = $page.url.searchParams.get('keyword') || ''
</script>

<Seo title="Search" />

<SearchBox placeholder="Search Grocery Store" />

{#if keyword.length != 0}
<Subtitle subtitle="Search Results for '{$page.url.searchParams.get('keyword')}'" />
<Products products={results} />
{/if}