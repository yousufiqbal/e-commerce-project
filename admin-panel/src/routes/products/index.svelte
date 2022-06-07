<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  // Fake data
  export let products = [
    { product_id: 1, name: 'Nurpur Butter 100g', url_name: 'nupur-butter-100-g', price: 250, stock: 500, unit_cost: 220 },
    { product_id: 2, name: 'Nurpur Butter 100g', url_name: 'nupur-butter-100-g', price: 250, stock: 500, unit_cost: 220 },
    { product_id: 3, name: 'Nurpur Butter 100g', url_name: 'nupur-butter-100-g', price: 250, stock: 500, unit_cost: 220 },
    { product_id: 4, name: 'Nurpur Butter 100g', url_name: 'nupur-butter-100-g', price: 250, stock: 500, unit_cost: 220 },
    { product_id: 5, name: 'Nurpur Butter 100g', url_name: 'nupur-butter-100-g', price: 250, stock: 500, unit_cost: 220 },
    { product_id: 6, name: 'Nurpur Butter 100g', url_name: 'nupur-butter-100-g', price: 250, stock: 500, unit_cost: 220 },
    { product_id: 7, name: 'Nurpur Butter 100g', url_name: 'nupur-butter-100-g', price: 250, stock: 500, unit_cost: 220 },
    { product_id: 8, name: 'Nurpur Butter 100g', url_name: 'nupur-butter-100-g', price: 250, stock: 500, unit_cost: 220 },
    { product_id: 9, name: 'Nurpur Butter 100g', url_name: 'nupur-butter-100-g', price: 250, stock: 500, unit_cost: 220 },
  ]
</script>

<Title title="Products" />

<ButtonGroup>
  <Button icon="add" name="New" href="/products/add-product" />
  <Button icon="add" name="Add Stock" href="/products/add-stock" />
</ButtonGroup>

{#if products.length != 0}
<Table>
  <tr>
    <th>Sr.</th>
    <!-- <th>Image</th> -->
    <th>Name</th>
    <th>Price</th>
    <th>Stock</th>
    <th>Cost</th>
  </tr>
  {#each products as product, index (product.product_id)}
  <tr>
    <td>{index + 1}</td>
    <!-- <td><img src="/products/{product.url_name}.jpg" alt=""></td> -->
    <td>{product.name}</td>
    <td>{product.price}</td>
    <td>{product.stock}</td>
    <td>{product.unit_cost}</td>
  </tr>
  {/each}
</Table>

{:else}
<Nothing>
  No Products
</Nothing>
{/if}