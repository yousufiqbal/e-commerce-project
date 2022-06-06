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

  let stock = {}, touched = false, errors = {}

  const mode = $page.params.mode
  const crumbs = [
    { name: 'Products', href: '/stocks', icon: 'listCheck' },
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

  // $: if (stock) validate()
</script>

<Breadcrumb {crumbs} />

<Title back="/products" title="{startCase(mode)} Stock" />

<Form>
  <Input label="Select Product" {touched} error={errors['category_id']} />
  <Input label="Stock" {touched} error={errors['stock']} />
  <Input label="Unit Cost" {touched} error={errors['unit_cost']} />
  <Input label="Price" {touched} error={errors['price']} />
  <div>
    <div>Current stock value / unit = Rs. </div>
    <div>Post addition stock value / unit = Rs. </div>
    <div>Recommended price = Rs. </div>
  </div>
</Form>

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Add Stock" type="primary" />
  <Button href="/products" icon="deleteBin" name="Discard" />
</ButtonGroup>