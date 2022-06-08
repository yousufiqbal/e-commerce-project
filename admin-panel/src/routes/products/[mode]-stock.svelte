<script>
  import { page } from "$app/stores";
  import { isEmpty, startCase } from 'lodash-es'
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import { extractYupErrors } from "$lib/database/schema";
  import Table from "$lib/components/Table.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Modal from "$lib/components/Modal.svelte";
  import SearchBox from "$lib/components/SearchBox.svelte";
  import Nothing from "$lib/components/Nothing.svelte";

  let product = { previousStock: 250, previousCost: 400 }, touched = false, errors = {}
  let margin = 25
  let modal = false
  let keyword = ''
  let el

  // Fake data
  let results = [
    { product_id: 1, name: 'Nurpur Butter 100g', url_name: 'nurpur-butter-100-g', price: 100, unit_cost: 80, stock: 100 },
    { product_id: 2, name: 'Surf Excel 100g', url_name: 'nurpur-butter-100-g', price: 100, unit_cost: 80, stock: 100 },
    { product_id: 3, name: 'Cheesey Potatoes 100g', url_name: 'nurpur-butter-100-g', price: 100, unit_cost: 80, stock: 100 },
    { product_id: 4, name: 'Express Power 100g', url_name: 'nurpur-butter-100-g', price: 100, unit_cost: 80, stock: 100 },
  ]

  const mode = $page.params.mode
  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: 'Add Stock', href: '/products/add-stock' },
  ]

  const validate = async () => {
    try {
      await stockSchema.validate(stock, { abortEarly: false })
      error = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if (mode == 'add') await addStock()
      if (mode == 'edit') await editStock()
    } else {
      touched = true
    }
  }

  const selectProduct = (product_id, name) => {
    product.product_id = product_id
    product.name = name
    modal = false
  }

  const search = async () => {
    // if (!keyword) {
    //   results = []
    //   return
    // }
    // try {
    //   const response = await a
    // } catch (error) {
      
    // }
  }

  // TODO blur or close not working..
  const close = () => {
    modal = false
    el.blur()
  }

  $: postStockValue = ((+product.previousStock * +product.previousCost) + (+product.stock * +product.unit_cost)) / (+product.previousStock + +product.stock)
  $: recommendedPrice = ((+postStockValue * (margin / 100)) + +postStockValue)
  $: keyword && search()
</script>

{#if modal}
<Modal on:close={close}>

  <Subtitle subtitle="Choose Product" />
  <SearchBox placeholder="Enter Product Name / ID" />

  {#if results.length != 0}
  <div class="products">

    {#each results as product}
    <button on:click={()=>selectProduct(product.product_id, product.name)} class="product">
      <div class="left">
        <img src="/products/nupur-butter-100-g.jpg" alt="">
      </div>
      <div class="right">
        <div class="name">{product.name}</div>
        <div class="detail">Price: {product.price}, Stock: {product.stock}, Cost: {product.unit_cost}</div>
      </div>
    </button>
    {/each}

  </div>
  {:else}
  <Nothing>
    No Products
  </Nothing>
  {/if}

</Modal>
{/if}

<Breadcrumb {crumbs} />

<Title back="/products" title="{startCase(mode)} Stock" />

<Form>
  <Field on:focus={()=>modal=true} bind:value={product.name} label="Product" {touched} error={errors['product_id']} />
  <Field bind:el bind:value={product.stock} label="Stock" {touched} error={errors['stock']} />
  <Field bind:value={product.unit_cost} label="Unit Cost" {touched} error={errors['unit_cost']} />
  <Field bind:value={product.price} label="Price" {touched} error={errors['price']} />
</Form>

<Subtitle icon="lineChart" subtitle="Metrics" />

<Table>
  <tr>
    <th>Value</th>
    <th class="main">Name</th>
  </tr>
  <tr>
    <td>{product.previousStock}</td>
    <td>Previous Stock Quanity</td>
  </tr>
  <tr>
    <td>Rs. {product.previousCost}</td>
    <td>Previous Stock Value / Unit</td>
  </tr>
  {#if recommendedPrice}
  <tr>
    <td>Rs. {recommendedPrice.toFixed(2)}</td>
    <td>Recommended price ({margin}% Margin)</td>
  </tr>
  {/if}
  {#if postStockValue}
  <tr>
    <td>Rs. {postStockValue.toFixed(2)}</td>
    <td>Post addition stock value / uni</td>
  </tr>
  {/if}
</Table>

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Add Stock" type="primary" />
  <Button href="/products" icon="close" name="Discard" />
</ButtonGroup>

<style>
  .products {
    /* border: 1px solid red; */
    display: grid;
    gap: 20px;
  }
  .product {
    padding: 10px;
    border: 1px solid var(--border);
    display: flex;
    align-items: start;
    border-radius: 5px;
    gap: 10px;
  }
  .product:hover .name {
    color: red;
  }
  .product > .left {
    width: 70px;
    /* border: 1px solid red; */
  }
  .product > .right {
    /* border: 1px dashed blue; */
    display: grid;
    /* align-items: start; */
    flex: 1;
  }
  .name {
    /* border: 1px solid red; */
  }
  .product .detail {
    /* border: 1px solid red; */
    justify-items: start;
    color: gray;
  }
</style>