<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Links from "$lib/components/Links.svelte";
  import Modal from "$lib/components/Modal.svelte";
  import Pagination from "$lib/components/Pagination.svelte";
  import Products from "$lib/components/Products.svelte";
  import Search from "$lib/components/Search.svelte";
  import SmartFilter from "$lib/components/SmartFilter.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  // Fake data
  export let products = []
  export let total = 0
  export let categories = [], brands = []
  let categoryModal = false, brandModal = false

  // 
  const children = [
    { name: 'Apple', url_name: 'apple' },
    { name: 'Banana', url_name: 'apple' },
    { name: 'Orange', url_name: 'apple' },
    { name: 'Grapes', url_name: 'apple' },
  ]

  const close = () => {
    categoryModal = false
    brandModal = false
  }
</script>

<Title title="Products" icon="listCheck" />

<ButtonGroup>
  <Button type="primary" icon="add" name="New Product" href="/products/add-product" />
  <Button icon="stock" name="Add Stock" href="/products/add-stock" />
  <Button shortcut="ctrl+k" icon="searchTwo" name="Search Products" href="/products/search" />
  <!-- <Button icon="deleteBin" name="Remove / Return Stock" href="/products/remove-stock" /> -->
</ButtonGroup>

<ButtonGroup>
  <Button icon="folders" name="Choose Category" on:click={()=>categoryModal=true} />
  <Button icon="folders" name="Choose Brand" on:click={()=>brandModal=true} />
</ButtonGroup>

<ButtonGroup>
  <Pagination {total} />
</ButtonGroup>

<Subtitle icon="folders" subtitle="All Categories" />
<Products {products} />

<!-- Modals -->
{#if categoryModal || brandModal}
<Modal on:close={close}>
  
  <!-- Category Modal -->
  {#if categoryModal}
  <Subtitle subtitle="Choose Category" />
  <SmartFilter focused placeholder="Filter Categories" searchColumn="path" bind:data={categories} />
  <Links>
    {#each categories as { category_id, path } (category_id)}
    <a href="?category_id={category_id}">{@html path}</a>
    {/each}
  </Links>
  {/if}
  
  <!-- Brand Modal -->
  {#if brandModal}
  <Subtitle subtitle="Choose Brand" />
  <SmartFilter focused placeholder="Filter Brands" bind:data={brands} />
  <Links>
    {#each brands as { brand_id, name } (brand_id)}
    <a href="?brand_id={brand_id}">{@html name}</a>
    {/each}
  </Links>
  {/if}

</Modal>
{/if}
