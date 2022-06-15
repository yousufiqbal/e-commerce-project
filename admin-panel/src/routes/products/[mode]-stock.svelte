<script>
  import { page } from "$app/stores";
  import { isEmpty, startCase } from 'lodash-es'
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import { extractYupErrors, stockSchema } from "$lib/others/schema";
  import Table from "$lib/components/Table.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Modal from "$lib/components/Modal.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Links from "$lib/components/Links.svelte";
  import { axios } from "$lib/others/utils";
  import Search from "$lib/components/Search.svelte";
  import { addToast } from "$lib/stores/toast";
  import Layout from "$lib/components/Layout.svelte";
  import Text from "$lib/components/Text.svelte";
  import Spaced from "$lib/components/Spaced.svelte";
  import { goto } from "$app/navigation";
  import { onMount } from "svelte";

  onMount(() => {
    if (!isEmpty(product)) el && el.focus()
  })

  export let products = []
  export let constants = {}
  export let product = {}
  let newStock = { unit_cost: 0, stock: 0, price: 0 }
  let touched = false, errors = {}
  let modal = { search: false, confirm: false }
  let el

  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: 'Add Stock', href: '/products/add-stock' },
  ]

  const validate = async () => {
    try {
      await stockSchema.validate(newStock, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      modal.confirm = true
    } else {
      touched = true
    }
  }

  const addStock = async () => {
    modal.confirm = false
    try {
      const response = await axios.post('/api/stocks?product_id='+product.product_id, newStock)
      addToast({ message: response.data.message })
      goto('/products')
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot add stock', type: 'error' })
    }
  }

  const selectProduct = pr => {
    product = pr
    modal.search = false
  }

  const search = async e => {
    let keyword = e.currentTarget.value
    if (!keyword) {
      products = [];
      return
    } else {
      try {
        const response = await axios.get('/api/search/products?keyword='+keyword)
        products = response.data
      } catch (error) {
        addToast({ message: 'Cannot get products', type: 'error'})
      }
    }
  }

  // TODO blur or close not working..
  const close = () => {
    modal.search = false
    el.blur()
  }

  $: if (newStock) validate()
  $: averageCost = Math.ceil(((product.unit_cost * product.stock) + (newStock.unit_cost * newStock.stock)) / (+product.stock + +newStock.stock))
  $: recommendedPrice = product && ((averageCost) + (averageCost * (constants.margin / 100)) + (averageCost * (constants.sales_tax / 100))).toFixed(2)
</script>

{#if modal.search}
<Modal on:close={close}>

  <Subtitle icon="listCheck" subtitle="Search Products" />
  <Search focused on:keyup={search} />

  {#if products.length != 0}
  <Links>
    {#each products as product (product.product_id)}
    <button on:click={()=>selectProduct(product)}>{product.name}</button>
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
<Title back="/products" title="{startCase($page.params.mode)} Stock" />

<Layout columns="1fr 1fr">

<div class="left">

<Subtitle icon="listCheck" subtitle="Choose Product" />
<Form>
  <Field on:focus={()=>modal.search=true} value={product.name} label="Product" {touched} error={errors['product_id']} />
</Form>

{#if !isEmpty(product)}
<Subtitle icon="listCheck" subtitle="New Stock & Price" />
<Form>
  <Field bind:el bind:value={newStock.stock} label="New Stock" {touched} error={errors['stock']} />
  <Field bind:value={newStock.unit_cost} label="Unit Cost" {touched} error={errors['unit_cost']} />
  <Field bind:value={newStock.price} placeholder={recommendedPrice} label="Price" {touched} error={errors['price']} />
</Form>

{#if newStock.price < newStock.unit_cost}
<div class="message">
  Price is less than cost by Rs. {(newStock.price - newStock.unit_cost).toFixed(2)}
</div>
{/if}

<ButtonGroup>
  <Button on:click={submit} shortcut="ctrl+enter" icon="save" name="Add Stock" type="primary" />
  <Button href="/products" icon="close" name="Discard" />
</ButtonGroup>

<Subtitle icon="listCheck" subtitle="Note" />
<Text>
  You can also set price other than recommended price, in accordance with market-value and other factors.
</Text>
{/if}

</div> <!-- Left -->

<div class="right">
{#if !isEmpty(product)}

<Subtitle icon="lineChart" subtitle="Current Stats" />
<Table>
  <tr>
    <td class="main">Current Stock Quanity</td>
    <td>{product.stock} Items</td>
  </tr>
  <tr>
    <td>Current Stock Value Per Unit</td>
    <td>Rs. {product.unit_cost}</td>
  </tr>
  <tr>
    <td>Current Price</td>
    <td>Rs. {product.price}</td>
  </tr>
</Table>

<Subtitle icon="calculator" subtitle="Calculations" />
<Table>
  <tr>
    <td class="main">Average Cost</td>
    <td>Rs. {averageCost.toFixed(2)}</td>
  </tr>
  <tr>
    <td>+ Margin ({constants.margin}%)</td>
    <td>Rs. {(averageCost * (constants.margin / 100)).toFixed(2)}</td>
  </tr>
  <tr>
    <td>+ Sales Tax ({constants.sales_tax}%)</td>
    <td>Rs. {(averageCost * (constants.sales_tax / 100)).toFixed(2)}</td>
  </tr>
  <tr class="strong">
    <td>Recommended Price without Delivery</td>
    <td>Rs. {recommendedPrice}</td>
  </tr>
  <tr>
    <td>+ Delivery Charges</td>
    <td>Rs. {constants.delivery_charges}</td>
  </tr>
  <tr>
    <td>Recommended Price with Delivery</td>
    <td>Rs. {(+recommendedPrice + +constants.delivery_charges).toFixed(2)}</td>
  </tr>
</Table>



{/if}
</div> <!-- Right -->

</Layout>

{#if modal.confirm}
<Modal on:close={()=>modal.confirm=false}>
  <Subtitle icon="errorWarning" subtitle="Confirm Stock Addition" />
  <Text>
    Stock addition mutates cost and hard-codes it. This action should be done with care. Are you sure you want to add this stock to <strong>{product.name}</strong>?
  </Text>
  <Spaced>
    <Button on:click={addStock} icon="check" name="Yes" />
    <Button on:click={()=>modal.confirm=false} icon="close" name="No" type="primary" />
  </Spaced>
</Modal>
{/if}

<style>
  .message {
    padding: var(--padding);
    border: 1px dashed var(--border);
    background-color: rgb(255, 252, 242);
    margin-bottom: 20px;
  }
</style>