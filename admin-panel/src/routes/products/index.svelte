<script>
import { page } from "$app/stores";

  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import Layout from "$lib/components/Layout.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Pagination from "$lib/components/Pagination.svelte";
  import Pills from "$lib/components/Pills.svelte";
  import StandaloneMenu from "$lib/components/StandaloneMenu.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";
import { startCase } from "lodash-es";

  // Fake data
  export let products = []
  export let total = 0
  export let parents = []

  // 
  const children = [
    { name: 'Apple', url_name: 'apple' },
    { name: 'Banana', url_name: 'apple' },
    { name: 'Orange', url_name: 'apple' },
    { name: 'Grapes', url_name: 'apple' },
  ]
</script>

<Title title="Products" />

<Layout columns="1fr 5fr">
  
  <div slot="left">
    <Subtitle icon="listCheck" subtitle="Categories" />
    <StandaloneMenu name="category" items={parents} />
  </div>
  
  <div slot="right">
    
    <Subtitle icon="listCheck" subtitle="{startCase($page.url.searchParams.get('category'))}" />
    
    <ButtonGroup>
      <Button type="primary" icon="add" name="New Product" href="/products/add-product" />
      <Button icon="stock" name="Add Stock" href="/products/add-stock" />
      <Button icon="deleteBin" name="Remove / Return Stock" href="/products/remove-stock" />
      <Button icon="searchTwo" name="Search Products (Ctrl + K)" href="/products/search" />
    </ButtonGroup>

  <Pills pills={children} />
  
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

</div>
</Layout>