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

  let brand = {}, touched = false, errors = {}

  const mode = $page.params.mode
  const crumbs = [
    { name: 'Brands', href: '/brands', icon: 'priceTagThree' },
    { name: 'Add Brand', href: '/brands/add-brand' },
  ]

  const validate = async () => {
    try {
      await brandSchema.validate(brand, { abortEarly: false })
      error = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if (mode == 'add') await addBrand()
      if (mode == 'edit') await editBrand()
    } else {
      touched = true
    }
  }

  // $: if (brand) validate()
</script>

<Breadcrumb {crumbs} />
<Title back="/brands" title="{startCase(mode)} Brand" />

<Form>
  <Field label="Name" {touched} error={errors['name']} />
</Form>

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Save" type="primary" />
  <Button href="/brands" icon="close" name="Discard" />
</ButtonGroup>