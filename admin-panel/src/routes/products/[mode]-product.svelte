<script>
  import { page } from "$app/stores";
  import { isEmpty, startCase } from 'lodash-es'
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import { extractYupErrors, makeProductSchema } from "$lib/others/schema";
  import Modal from "$lib/components/Modal.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import SmartFilter from "$lib/components/SmartFilter.svelte";
  import Links from "$lib/components/Links.svelte";
  import Table from "$lib/components/Table.svelte";
  import { axios, stripTags } from "$lib/others/utils";
  import { addToast } from "$lib/stores/toast";
  import Layout from "$lib/components/Layout.svelte";
  import { goto } from "$app/navigation";

  export let categories = [], brands = [], constants = {}
  export let product = { category_path: '', brand_name: '', category_id: null, brand_id: null, name: '', sku: null, stock: 0, unit_cost: 0, price: 0, fair_quantity: '0', description: '' }
  let touched = false, errors = {}

  let categoryModal = false, brandModal = false
  let productSchema = makeProductSchema(categories, brands)

  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: `${startCase($page.params.mode)} Product`, href: `/products/${$page.params.mode}-product` },
  ]

  const validate = async () => {
    try {
      await productSchema.validate(product, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if ($page.params.mode == 'add') await addProduct()
      if ($page.params.mode == 'edit') await editProduct()
    } else {
      touched = true
    }
  }

  const close = () => {
    categoryModal = false
    brandModal = false
  }

  const selectCategory = (id, path) => {
    product.category_id = id
    product.category_path = stripTags(path)
    categoryModal = false
  }

  const selectBrand = (id, name) => {
    product.brand_id = id
    product.brand_name = stripTags(name)
    brandModal = false
  }

  const addProduct = async () => {
    try {
      const response = await axios.post('/api/products', product)
      addToast({ message: response.data.message })
      goto('/products/add-product-image?product_id='+response.data.product_id)
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot add product', type: 'error' })
    }
  }

  $: if (product) validate()
  $: recommendedPrice = ((+product.unit_cost) + (+constants.delivery_charges) + (+product.unit_cost * (constants.margin / 100)) + (+product.unit_cost * (constants.sales_tax / 100))).toFixed(2)
</script>

<!-- Top -->
<Breadcrumb {crumbs} />
<Title back="/products" title="{startCase($page.params.mode)} Product" />

<Layout columns="1fr 1fr">

<div slot="left">

<!-- Fields -->
<Subtitle icon="listOrdered" subtitle="General Info" />
<Form>
  <Field on:focus={()=>{categoryModal=true}} value={product.category_path} label="Category" {touched} error={errors['category_id']} />
  <Field on:focus={()=>{brandModal=true}} value={product.brand_name} label="Brand" {touched} error={errors['brand_id']} />
  <Field bind:value={product.name} label="Name" {touched} error={errors['name']} />
  <Field bind:value={product.sku} label="SKU" placeholder="Barcode" {touched} error={errors['name']} />
  <Field textarea bind:value={product.description} label="Description" {touched} error={errors['description']} />
</Form>

<Subtitle icon="listOrdered" subtitle="Stock & Price" />
<Form>
  <Field bind:value={product.stock} label="Stock" {touched} error={errors['stock']} inputmode="numeric" />
  <Field bind:value={product.unit_cost} label="Unit Cost" {touched} error={errors['unit_cost']} inputmode="numeric" />
  <Field bind:value={product.price} placeholder={product.unit_cost && product.stock ? recommendedPrice : ''} label="Price" {touched} error={errors['price']} inputmode="numeric" />
  <Field bind:value={product.fair_quantity} label="Fair Quantity" {touched} error={errors['fair_quantity']} inputmode="numeric" />
</Form>

</div>

<div slot="right">
      
<!-- Calculations -->
<Subtitle icon="calculator" subtitle="Calculations" />
<Table>
  <tr>
    <td class="main">Unit Cost</td>
    <td>Rs. {product.unit_cost}</td>
  </tr>
  <tr>
    <td>+ Margin ({constants.margin}%)</td>
    <td>Rs. {(product.unit_cost * (constants.margin / 100)).toFixed(2)}</td>
  </tr>
  <tr>
    <td>+ Sales Tax ({constants.sales_tax}%)</td>
    <td>Rs. {(product.unit_cost * (constants.sales_tax / 100)).toFixed(2)}</td>
  </tr>
  <tr class="strong">
    <td>Recommended Price without Delivery</td>
    <td>Rs. {(recommendedPrice - constants.delivery_charges).toFixed(2)}</td>
  </tr>
  <tr>
    <td>+ Delivery Charges</td>
    <td>Rs. {constants.delivery_charges}</td>
  </tr>
  <tr>
    <td>Recommended Price with Delivery</td>
    <td>Rs. {recommendedPrice}</td>
  </tr>
</Table>

</div>

</Layout>

<!-- Actions -->
<ButtonGroup>
  <Button on:click={submit} icon="save" name="Save" type="primary" />
  <Button href="/products" icon="close" name="Discard" />
</ButtonGroup>

<!-- Modals -->
{#if categoryModal || brandModal}
<Modal on:close={close}>
  
  <!-- Category Modal -->
  {#if categoryModal}
  <Subtitle subtitle="Choose Category" />
  <SmartFilter placeholder="Filter Categories" searchColumn="path" bind:data={categories} />
  <Links>
    {#each categories as { category_id, path } (category_id)}
    <button on:click={()=>selectCategory(category_id, path)}>{@html path}</button>
    {/each}
  </Links>
  {/if}
  
  <!-- Brand Modal -->
  {#if brandModal}
  <Subtitle subtitle="Choose Brand" />
  <SmartFilter placeholder="Filter Brands" bind:data={brands} />
  <Links>
    {#each brands as { brand_id, name } (brand_id)}
    <button on:click={()=>selectBrand(brand_id, name)}>{@html name}</button>
    {/each}
  </Links>
  {/if}

</Modal>
{/if}
