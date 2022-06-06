<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  // Dummy Data
  export let brands = [
    { brand_id: 1, name: 'Nokia' },
    { brand_id: 2, name: 'Samsung' },
    { brand_id: 3, name: 'Sony' },
    { brand_id: 4, name: 'LG' },
    { brand_id: 5, name: 'Microsoft' },
    { brand_id: 6, name: 'Xiaomi' },
  ]
</script>

<Title title="Brands" />

<ButtonGroup>
  <Button icon="add" name="New" />
</ButtonGroup>

{#if brands.length != 0}
<Table>
  <tr>
    <th>Sr.</th>
    <th class="main">Name</th>
    <td></td>
  </tr>
  {#each brands as brand, index (brand.brand_id)}
  <tr>
    <td>{index + 1}</td>
    <td>{brand.name}</td>
    <td><a href="/brands/edit-brand?brand_id={brand.brand_id}">Edit</a></td>
  </tr>
  {/each}
</Table>
{:else}
   <!-- else content here -->
{/if}