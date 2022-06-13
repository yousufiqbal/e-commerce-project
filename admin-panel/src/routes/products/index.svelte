<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
import Pagination from "$lib/components/Pagination.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  // Fake data
  export let products = []
  export let total = 0
</script>

<Title title="Products" />

<ButtonGroup>
  <Button icon="add" name="New Product" href="/products/add-product" />
  <Button icon="add" name="Add Stock" href="/products/add-stock" />
</ButtonGroup>

<Subtitle subtitle="Dairy" />

<ButtonGroup>
  <Button icon="add" name="New Product" href="/products/add-product" />
</ButtonGroup>

{#if products.length != 0}
<Table>
  <tr>
    <th>Sr.</th>
    <!-- <th>Image</th> -->
    <th class="main">Name</th>
    <th>Price</th>
    <th>Stock</th>
    <th>Cost</th>
    <th>Fair</th>
    <th>SKU</th>
    <th></th>
  </tr>
  {#each products as product, index (product.product_id)}
  <tr>
    <td>{index + 1}</td>
    <!-- <td><img src="/products/{product.url_name}.jpg" alt=""></td> -->
    <td><a href="/products/{product.product_id}">{product.name}</a></td>
    <td>{product.price}</td>
    <td>{product.stock}</td>
    <td>{product.unit_cost}</td>
    <td>{product.fair_quantity}</td>
    <td>{product.sku}</td>
    <td><a href="/products/edit-product?product_id={product.product_id}">Edit</a></td>
  </tr>
  {/each}
</Table>

{:else}
<Nothing>
  No Products
</Nothing>
{/if}

<Pagination {total} />