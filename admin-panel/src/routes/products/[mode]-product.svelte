<script>
  import { page } from "$app/stores";
  import { isEmpty, kebabCase, startCase } from 'lodash-es'
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Input from "$lib/components/Input.svelte";
  import Form from "$lib/components/Form.svelte";
  import { extractYupErrors } from "$lib/database/schema";

  let product = {}, touched = false, errors = {}

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

  // $: if (product) validate()
  $: if (product.name) product.url_name = kebabCase(product.name)
  $: if (!product.name) product.url_name = ''
</script>

<Breadcrumb {crumbs} />

<Title back="/products" title="{startCase(mode)} Product" />

<Form>
  <Input bind:value={product.category_id} label="Select Category" {touched} error={errors['category_id']} />
  <Input bind:value={product.brand_id} label="Select Brand" {touched} error={errors['brand_id']} />
  <Input bind:value={product.name} label="Name" {touched} error={errors['name']} />
  <Input bind:value={product.url_name} label="URL Name" {touched} error={errors['url_name']} />
  <Input bind:value={product.stock} label="Stock" {touched} error={errors['stock']} />
  <Input bind:value={product.unit_cost} label="Unit Cost" {touched} error={errors['unit_cost']} />
  <Input bind:value={product.price} label="Price" {touched} error={errors['price']} />
  <Input bind:value={product.fair_quantity} label="Fair Quantity" {touched} error={errors['fair_quantity']} />
  <Input bind:value={product.description} label="Description" {touched} error={errors['description']} />
  <div>
    <div>Recommended price = Rs. </div>
  </div>
</Form>

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Save" type="primary" />
  <Button href="/products" icon="deleteBin" name="Discard" />
</ButtonGroup>