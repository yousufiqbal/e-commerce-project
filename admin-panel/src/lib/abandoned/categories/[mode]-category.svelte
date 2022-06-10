<script>
  import { page } from "$app/stores";
  import { isEmpty, kebabCase, startCase } from 'lodash-es'
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import { categorySchema, extractYupErrors } from "$lib/others/schema";
  import { axios } from "$lib/others/utils";
  import { addToast } from "$lib/stores/toast";
import DeleteThis from "$lib/components/DeleteThis.svelte";

  export let category = { name: '', url_name: '' }
  let touched = false, errors = {}
  let el

  const crumbs = [
    { name: 'Categories', href: '/categories', icon: 'folders' },
    { name: startCase($page.params.mode) + ' Category', href: `/categories/${$page.params.mode}-category` },
  ]

  const validate = async () => {
    try {
      await categorySchema.validate(category, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if ($page.params.mode == 'add') await addCategory()
      if ($page.params.mode == 'edit') await editCategory()
    } else {
      touched = true
    }
  }

  const addCategory = async () => {
    try {
      const response = await axios.post('/api/categories', category)
      addToast({ message: response.data.message })
      reset()
    } catch (error) {
      addToast('Cannot add category')
    }
  }

  const editCategory = async () => {
    try {
      const response = await axios.put('/api/categories?category_id='+$page.url.searchParams.get('category_id'), category)
      addToast({ message: response.data.message })
      history.go(-1)
    } catch (error) {
      addToast('Cannot add category')
    }
  }

  const reset = () => {
    category = {}
    setTimeout(() => {
      touched = false
      errors = {}
      el.focus()
    }, 0);
  }

  // Computed
  $: if (category) validate()
  $: if (category.name) category.url_name = kebabCase(category.name)
</script>

<Breadcrumb {crumbs} />
<Title back="/categories" title="{startCase($page.params.mode)} Category" />

<Form>
  <Field bind:el label="Name" bind:value={category.name} {touched} error={errors.name} />
  <Field label="URL Name" bind:value={category.url_name} {touched} error={errors.url_name} />
</Form>

<ButtonGroup>
  <Button shortcut="ctrl+enter" on:click={submit} icon="save" name="Save" type="primary" />
  <Button href="/categories" icon="close" name="Discard" />
</ButtonGroup>

{#if $page.params.mode == 'edit'}
<DeleteThis />
{/if}