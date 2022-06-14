<script>
  import { page } from "$app/stores";
  import { isEmpty, startCase } from 'lodash-es'
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import { extractYupErrors } from "$lib/others/schema";
  import Table from "$lib/components/Table.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Modal from "$lib/components/Modal.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Layout from "$lib/components/Layout.svelte";
  import SmartFilter from "$lib/components/SmartFilter.svelte";
  import Links from "$lib/components/Links.svelte";
  import { stripTags } from "$lib/others/utils";

  export let constants = {}
  let product = { previousStock: 250, previousCost: 400 }
  let touched = false, errors = {}
  let modal = false
  let el

  export let products = []

  const mode = $page.params.mode
  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: 'Add Stock', href: '/products/add-stock' },
  ]

  const validate = async () => {
    try {
      await stockSchema.validate(stock, { abortEarly: false })
      errors = {}
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

  const selectProduct = pr => {
    product.product_id = pr.product_id
    product.name = stripTags(pr.name)
    product.sku = pr.sku
    modal = false
  }

  // TODO blur or close not working..
  const close = () => {
    modal = false
    el.blur()
  }

  $: recommendedPrice = ((+product.unit_cost) + (+constants.delivery_charges) + (+product.unit_cost * (constants.margin / 100)) + (+product.unit_cost * (constants.sales_tax / 100))).toFixed(2)
  // $: if (product) validate()
</script>

{#if modal}
<Modal on:close={close}>

  <Subtitle icon="searchTwo" subtitle="Search Product" />
  <SmartFilter bind:data={products} focused placeholder="Enter Product Name / SKU" />

  {#if products.length != 0}
  <Links>
    {#each products as product (product.product_id)}
    <button on:click={()=>selectProduct(product)}>{@html product.name}</button>
    {/each}
  </Links>

  {:else}
  <Nothing>
    No Products
  </Nothing>
  {/if}

</Modal>
{/if}

<Breadcrumb {crumbs} />
<Title back="/products" title="{startCase(mode)} Stock" />

<Layout columns="1fr 1fr">
  <div slot="left">
    <Subtitle icon="listCheck" subtitle="Choose Product" />
    <Form>
      <!-- <Field bind:value={product.sku} label="SKU" {touched} error={errors['unit_cost']} /> -->
      <Field on:focus={()=>modal=true} value={product.name} label="Product" {touched} error={errors['product_id']} />
    </Form>
    
    <Subtitle icon="listCheck" subtitle="New Stock & Price" />
    <Form>
      <Field bind:el bind:value={product.stock} label="New Stock" {touched} error={errors['stock']} />
      <Field bind:value={product.unit_cost} label="Unit Cost" {touched} error={errors['unit_cost']} />
      <Field bind:value={product.price} label="Price" {touched} error={errors['price']} />
    </Form>
    <ButtonGroup>
      <Button on:click={submit} icon="save" name="Add Stock" type="primary" />
      <Button href="/products" icon="close" name="Discard" />
    </ButtonGroup>
  </div>
  <div slot="right">
    <!-- Calculations -->
    <Subtitle icon="lineChart" subtitle="Current Stats" />
    <Table>
      <tr>
        <td class="main">Current Stock Quanity</td>
        <td>WIP</td>
      </tr>
      <tr>
        <td>Current Stock Unit Cost</td>
        <td>WIP</td>
      </tr>
      <tr>
        <td>Current Price</td>
        <td>WIP</td>
      </tr>
    </Table>

    <!-- Calculations -->
    <Subtitle icon="calculator" subtitle="Calculations" />
    <Table>
      <tr>
        <td class="main">Actual Price</td>
        <td>Rs. {product.unit_cost}</td>
      </tr>
      <tr>
        <td>Margin ({constants.margin}%)</td>
        <td>Rs. {(product.unit_cost * (constants.margin / 100)).toFixed(2)}</td>
      </tr>
      <tr>
        <td>Delivery Charges</td>
        <td>Rs. {constants.delivery_charges}</td>
      </tr>
      <tr>
        <td>Sales Tax ({constants.sales_tax}%)</td>
        <td>Rs. {(product.unit_cost * (constants.sales_tax / 100)).toFixed(2)}</td>
      </tr>
      <tr>
        <td>Recommended Price with Delivery</td>
        <td>Rs. {recommendedPrice}</td>
      </tr>
      <tr>
        <td>Recommended Price without Delivery</td>
        <td>Rs. {recommendedPrice - constants.delivery_charges}</td>
      </tr>
    </Table>
  </div>
</Layout>