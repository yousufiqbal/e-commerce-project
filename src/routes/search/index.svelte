<script>
import { page } from "$app/stores";

  import Products from "$lib/components/Products.svelte";
  import SearchBox from "$lib/components/SearchBox.svelte";
  import Seo from "$lib/components/Seo.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
</script>

<Seo title="Search" />
<SearchBox placeholder="Search Grocery Store" />

<Subtitle subtitle="Search Results for '{$page.url.searchParams.get('keyword')}'" />

<Products />