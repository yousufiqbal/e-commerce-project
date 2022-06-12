<script>
  import { page } from "$app/stores";
  import { isEmpty, kebabCase, startCase } from 'lodash-es'
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

  export let categories = [], brands = []
  // Extra props: category_path, brand_name
  let product = { category_id: null, brand_id: null, name: '', stock: 0, unit_cost: 0, price: 0, fair_quantity: 0, description: '' }
  let touched = false, errors = {}

  let categoryModal = false, brandModal = false
  let productSchema = makeProductSchema(categories, brands)

  // Constants
  const margin = 25, salesTax = 17
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
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot add product', type: 'error' })
    }
  }

  $: if (product) validate()
  $: recommendedPrice = ((+product.unit_cost * (margin / 100)) + +product.unit_cost + (+product.unit_cost * (salesTax / 100)))
</script>

<Breadcrumb {crumbs} />

<Title back="/products" title="{startCase($page.params.mode)} Product" />

<Subtitle icon="listOrdered" subtitle="Main Image" />
<ButtonGroup>
  <Button icon="imageAdd" name="Add Image" />
</ButtonGroup>

<Subtitle icon="listOrdered" subtitle="Carousel" />
<ButtonGroup>
  <Button icon="imageAdd" name="Add Image" />
</ButtonGroup>

<Subtitle icon="listOrdered" subtitle="Details" />
<Form>
  <Field on:focus={e=>{categoryModal=true; e.target.blur()}} value={product.category_path} label="Category" {touched} error={errors['category_id']} />
  <Field on:focus={e=>{brandModal=true; e.target.blur()}} value={product.brand_name} label="Brand" {touched} error={errors['brand_id']} placeholder="Optional" />
  <Field bind:value={product.name} label="Name" {touched} error={errors['name']} />
  <Field bind:value={product.sku} label="SKU" placeholder="Barcode" {touched} error={errors['name']} />
  <Field bind:value={product.stock} label="Stock" {touched} error={errors['stock']} inputmode="numeric" />
  <Field bind:value={product.unit_cost} label="Unit Cost" {touched} error={errors['unit_cost']} inputmode="numeric" />
  <Field bind:value={product.price} placeholder={recommendedPrice} label="Price" {touched} error={errors['price']} inputmode="numeric" />
  <Field bind:value={product.fair_quantity} label="Fair Quantity" {touched} error={errors['fair_quantity']} inputmode="numeric" />
  <Field textarea bind:value={product.description} label="Description" {touched} error={errors['description']} />
</Form>

{#if recommendedPrice}
<Subtitle icon="lineChart" subtitle="Metrics" />

<Table>
  <tr>
    <td>Recommended price ({margin}% Margin) & ({salesTax}% Sales Tax)</td>
    <td>Rs. {recommendedPrice.toFixed(2)}</td>
  </tr>
</Table>
{/if}

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Save" type="primary" />
  <Button href="/products" icon="close" name="Discard" />
</ButtonGroup>


{#if categoryModal || brandModal}
<Modal on:close={close}>

  {#if categoryModal}
  <Subtitle subtitle="Choose Category" />
  <SmartFilter placeholder="Filter Categories" searchColumn="path" bind:data={categories} />
  <Links>
    {#each categories as { category_id, path } (category_id)}
    <button on:click={()=>selectCategory(category_id, path)}>{@html path}</button>
    {/each}
  </Links>
  {/if}
  
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
