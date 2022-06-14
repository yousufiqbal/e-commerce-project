<script>
  import Nothing from "./Nothing.svelte";
  import Table from "./Table.svelte";

  export let products = []
</script>

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
    <td><a href="/products/add-stock?product_id={product.product_id}">+ Stock</a></td>
  </tr>
  {/each}
</Table>

{:else}
<Nothing>
  No Products
</Nothing>
{/if}