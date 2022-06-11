<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import Modal from "$lib/components/Modal.svelte";
  import Options from "$lib/components/Options.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
  import { extractYupErrors, makeSubcategorySchema } from "$lib/others/schema";
  import { axios } from "$lib/others/utils";
  import { addToast } from "$lib/stores/toast";
  import { isEmpty, kebabCase, startCase } from "lodash-es";

  export let categories = []
  let modal = false
  export let subcategory = { category_name: '', parent_id: '', name: '', url_name: ''}
  let touched = false, errors = {}
  const subcategorySchema = makeSubcategorySchema(categories.map(category => category.category_id))

  const category_id = +$page.url.searchParams.get('category_id') || null
  if (category_id) {
    const category = categories.filter(category => +category.category_id == +category_id)[0]
    subcategory.category_name = category.name
    subcategory.parent_id = category.category_id
  }

  const crumbs = [
    { name: 'Categories', href: '/categories' },
    { name: startCase($page.params.mode) + ' Subcategory', href: `/categories/${$page.params.mode}-subcategory` },
  ]

  const selectCategory = (category_id, name) => {
    subcategory.category_name = name
    subcategory.parent_id = category_id
    modal = false
  }

  const validate = async () => {
    try {
      await subcategorySchema.validate(subcategory, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if ($page.params.mode == 'add') await addSubcategory()
      if ($page.params.mode == 'edit') await editSubcategory()
    } else {
      touched = true
    }
  }

  const reset = () => {
    subcategory = {}
    setTimeout(() => {
      touched = false
      errors = {}
    }, 0);
  }

  const addSubcategory = async () => {
    try {
      const response = await axios.post('/api/subcategories', subcategory)
      addToast({ message: response.data.message, type: 'success' })
      reset()
    } catch (error) {
      addToast({ message: 'Unable to add subcategory', type: 'error' })
    }
  }

  const editSubcategory = async () => {
    try {
      const response = await axios.put('/api/subcategories?category_id=' + $page.url.searchParams.get('subcategory_id'), subcategory)
      addToast({ message: response.data.message, type: 'success' })
      reset()
    } catch (error) {
      addToast({ message: 'Unable to edit subcategory', type: 'error' })
    }
  }

  $: subcategory.url_name = kebabCase(subcategory.name) || ''
  $: if (subcategory) validate()
</script>

<Breadcrumb {crumbs} />

<Title back="/categories" title="{startCase($page.params.mode)} Subcategory" />

<Form>
  <Field on:focus={e=>{modal=true;e.target.blur()}} value={subcategory.category_name} {touched} error={errors.parent_id} label="Category" />
  <Field bind:value={subcategory.name} {touched} error={errors.name} label="Subcategory" />
  <Field value={subcategory.url_name} {touched} error={errors.url_name} label="URL Name" />
</Form>

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Save" type="primary" />
  <Button icon="close" name="Discard" href="/categories" />
</ButtonGroup>

{#if modal}
<Modal on:close={()=>modal=false}>

  <Subtitle subtitle="Choose Category" />

  <Options>
    {#each categories as category}
    <button on:click={()=>selectCategory(category.category_id, category.name)}>{category.name}</button>
    {/each}
  </Options>

</Modal>
{/if}