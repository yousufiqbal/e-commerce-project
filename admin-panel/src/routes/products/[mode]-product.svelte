<script>
  import { page } from "$app/stores";
  import { isEmpty, startCase } from 'lodash-es'
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
</script>

<Breadcrumb {crumbs} />

<Title back="/products" title="{startCase(mode)} Product" />

<Form>
  <Input label="Select Category" {touched} error={errors['category_id']} />
  <Input label="Select Brand" {touched} error={errors['brand_id']} />
  <Input label="Name" {touched} error={errors['name']} />
  <Input label="URL Name" {touched} error={errors['url_name']} />
  <Input label="Stock" {touched} error={errors['stock']} />
  <Input label="Unit Cost" {touched} error={errors['unit_cost']} />
  <Input label="Price" {touched} error={errors['price']} />
  <Input label="Fair Quantity" {touched} error={errors['fair_quantity']} />
  <Input label="Description" {touched} error={errors['description']} />
</Form>

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Save" type="primary" />
  <Button href="/products" icon="deleteBin" name="Discard" />
</ButtonGroup>