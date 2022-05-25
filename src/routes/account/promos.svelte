<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Title from "$lib/components/Title.svelte";
  import Promos from "$lib/components/Promos.svelte";
import QueryTabs from "$lib/components/QueryTabs.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Promos', href: '/account/promos' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Promos" />

<QueryTabs />

<Promos />