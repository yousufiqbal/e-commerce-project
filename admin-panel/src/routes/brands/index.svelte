<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  // Dummy Data
  export let brands = []
</script>

<Title title="Brands" icon="priceTagThree" />

<ButtonGroup>
  <Button icon="add" name="New Brand" href="/brands/add-brand" />
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

<Nothing>
  No Brands
</Nothing>
{/if}