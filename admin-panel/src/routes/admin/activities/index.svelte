<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Nothing from "$lib/components/Nothing.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  export let activities = []

  const crumbs = [
    { name: 'Admin', href: '/admin', icon: 'admin' },
    { name: 'Activities', href: '/admin/activities' },
  ]
</script>

<Title title="Activities"  />

<Breadcrumb {crumbs} />

{#if activities.length != 0}
<Table>
  <tr>
    <th>Sr.</th>
    <th>ID</th>
    <th>Detail</th>
    <th>Created</th>
  </tr>
  {#each activities as activity}
     <!-- content here -->
  {/each}
</Table>
{:else}
<Nothing>
  No Activities
</Nothing>
{/if}