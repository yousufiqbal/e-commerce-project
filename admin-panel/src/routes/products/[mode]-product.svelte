<script>
  import { page } from "$app/stores";
  import { isEmpty, kebabCase, startCase } from 'lodash-es'
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import { extractYupErrors } from "$lib/database/schema";
  import Text from "$lib/components/Text.svelte";
  import Modal from "$lib/components/Modal.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import SearchBox from "$lib/components/SearchBox.svelte";
  import Results from "$lib/components/Results.svelte";

  let product = { unit_cost: 0, price: 0, stock: 0, fair_quantity: 10 }, touched = false, errors = {}
  let margin = 25
  let categoryModal = true, brandModal = false

  let categoryResults = [
    { id: 1, name: 'Dairy' },
    { id: 2, name: 'Books' },
    { id: 3, name: 'Electronics' },
    { id: 4, name: 'Cellphones' },
  ]

  let brandResults = [
    { id: 1, name: 'Nokia' },
    { id: 2, name: 'Samsung' },
    { id: 3, name: 'Sony' },
    { id: 4, name: 'Xiaomi' },
  ]

  const mode = $page.params.mode
  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: 'Add Product', href: '/products/add-product' },
  ]

  const validate = async () => {
    try {
      await productSchema.validate(product, { abortEarly: false })
      error = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if (mode == 'add') await addProduct()
      if (mode == 'edit') await editProduct()
    } else {
      touched = true
    }
  }

  const close = () => {
    categoryModal = false
    brandModal = false
  }

  const selectCategory = e => {
    product.category_id = e.detail.id
    product.category_name = e.detail.name
    categoryModal = false
  }

  const selectBrand = e => {
    product.brand_id = e.detail.id
    product.brand_name = e.detail.name
    brandModal = false
  }

  // Naming url_name..
  $: if (product.name) product.url_name = kebabCase(product.name)
  $: if (!product.name) product.url_name = ''
  $: recommendedPrice = ((+product.unit_cost * (margin / 100)) + +product.unit_cost)
</script>

<Breadcrumb {crumbs} />

<Title back="/products" title="{startCase(mode)} Product" />

<Form>
  <Field on:focus={()=>categoryModal=true} bind:value={product.category_name} label="Category" {touched} error={errors['category_id']} />
  <Field on:focus={()=>brandModal=true} bind:value={product.brand_name} label="Brand" {touched} error={errors['brand_id']} placeholder="Optional" />
  <Field bind:value={product.name} label="Name" {touched} error={errors['name']} />
  <Field bind:value={product.url_name} label="URL Name" {touched} error={errors['url_name']} />
  <Field bind:value={product.stock} label="Stock" {touched} error={errors['stock']} inputmode="numeric" />
  <Field bind:value={product.unit_cost} label="Unit Cost" {touched} error={errors['unit_cost']} inputmode="numeric" />
  <Field bind:value={product.price} placeholder={recommendedPrice} label="Price" {touched} error={errors['price']} inputmode="numeric" />
  <Field bind:value={product.fair_quantity} label="Fair Quantity" {touched} error={errors['fair_quantity']} inputmode="numeric" />
  <Field textarea bind:value={product.description} label="Description" {touched} error={errors['description']} />
</Form>

{#if recommendedPrice}
<Text>
  <div>Recommended price = Rs. {recommendedPrice} ({margin}% margin)</div>
</Text>
{/if}

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Save" type="primary" />
  <Button href="/products" icon="close" name="Discard" />
</ButtonGroup>

{#if categoryModal || brandModal}
<Modal on:close={close}>

  {#if categoryModal}
  <Subtitle subtitle="Choose Category" />
  <SearchBox placeholder="Enter Category Name / ID" />
  <Results results={categoryResults} on:select={selectCategory} />
  {/if}
  
  {#if brandModal}
  <Subtitle subtitle="Choose Brand" />
  <SearchBox placeholder="Enter Brand Name / ID" />
  <Results results={brandResults} on:select={selectBrand} />
  {/if}

</Modal>
{/if}
