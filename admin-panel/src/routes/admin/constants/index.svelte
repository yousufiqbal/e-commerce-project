<script>
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Table from "$lib/components/Table.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Nothing from "$lib/components/Nothing.svelte";

  const crumbs = [
    { name: 'Admin', href: '/admin', icon: 'admin' },
    { name: 'Constants', href: '/admin/constants' },
  ]

  // Dummy data
  export let constants = []
</script>

<Breadcrumb {crumbs} />

<Title back="/admin" title="Constants" />

<ButtonGroup>
  <Button icon="add" name="New" href="/admin/constants/add-constant" />
</ButtonGroup>

{#if constants.length != 0}
<Table>
  <tr>
    <th>Sr.</th>
    <th >Name</th>
    <th class="main">Value</th>
    <th></th>
  </tr>
  {#each constants as constant, index (constant.constant_id)}
  <tr>
    <td>{index + 1}</td>
    <td>{constant.name}</td>
    <td>{constant.value}</td>
    <th><a href="/admin/constants/edit-constant?constant_id={constant.constant_id}">Edit</a></th>
  </tr>
  {/each}
</Table>

{:else}
<Nothing>
  No constants
</Nothing>
{/if}