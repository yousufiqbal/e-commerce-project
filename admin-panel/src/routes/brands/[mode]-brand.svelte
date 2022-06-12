<script>
  import { page } from "$app/stores";
  import { isEmpty, startCase } from 'lodash-es'
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import { brandSchema, extractYupErrors } from "$lib/others/schema";
  import { axios } from "$lib/others/utils";
  import { addToast } from "$lib/stores/toast";
  import DeleteThis from "$lib/components/DeleteThis.svelte";
import { goto } from "$app/navigation";

  export let brand = { name: '' }
  let touched = false, errors = {}

  const crumbs = [
    { name: 'Brands', href: '/brands', icon: 'priceTagThree' },
    { name: `${startCase($page.params.mode)} Brand`, href: `/brands/${$page.params.mode}-brand` },
  ]

  const validate = async () => {
    try {
      await brandSchema.validate(brand, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const addBrand = async () => {
    try {
      const response = await axios.post('/api/brands', brand)
      addToast({ message: response.data.message })
      goto('/brands')
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot add brand', type: 'error' })
    }
  }

  const editBrand = async () => {
    try {
      const response = await axios.put('/api/brands?brand_id='+$page.url.searchParams.get('brand_id'), brand)
      addToast({ message: response.data.message })
      goto('/brands')
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot edit brand', type: 'error' })
    }
  }

  const removeBrand = async () => {
    try {
      const response = await axios.delete('/api/brands?brand_id='+$page.url.searchParams.get('brand_id'))
      addToast({ message: response.data.message })
      goto('/brands')
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot remove brand', type: 'error' })
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if ($page.params.mode == 'add') await addBrand()
      if ($page.params.mode == 'edit') await editBrand()
    } else {
      touched = true
    }
  }

  $: if (brand) validate()
</script>

<Breadcrumb {crumbs} />
<Title back="/brands" title="{startCase($page.params.mode)} Brand" />

<Form>
  <Field label="Name" bind:value={brand.name} {touched} error={errors.name} />
</Form>

<ButtonGroup>
  <Button on:click={submit} shortcut="ctrl+enter" icon="save" name="Save" type="primary" />
  <Button href="/brands" icon="close" name="Discard" />
</ButtonGroup>

{#if $page.params.mode == 'edit'}
<DeleteThis on:yes={removeBrand} /> 
{/if}