<script>
import { goto } from "$app/navigation";

import { page } from "$app/stores";

  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import Title from "$lib/components/Title.svelte";
import { categorySchema, extractYupErrors } from "$lib/others/schema";
import { axios } from "$lib/others/utils";
import { addToast } from "$lib/stores/toast";
  import { isEmpty, kebabCase } from "lodash-es";

  let category = { name: '', url_name: '' }
  let touched = false, errors = {}

  const crumbs = [
    { name: 'Categories', href: '/categories' },
    { name: 'Add Category', href: '/categories/add-category' },
  ]

  const submit = async () => {
    if (isEmpty(errors)) {
      if ($page.params.mode == 'add') addCategory()
      if ($page.params.mode == 'edit') editCategory()
    } else {
      touched = true
    }
  }

  const validate = async () => {
    try {
      await categorySchema.validate(category, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
      
    }
  }

  const addCategory = async () => {
    try {
      const response = await axios.post('/api/categories', category)
      addToast({ message: response.data.message, type: 'success'})
      goto('/categories')
    } catch (error) {
      addToast({ message: 'Cannot add category', type: 'error'})
    }
  }

  // URL Name
  $: if (category) category.url_name = kebabCase(category.name) || ''
  // Validation
  $: if (category) validate()
</script>

<Breadcrumb {crumbs} />
<Title back title="Add Category" />

<Form>
  <Field bind:value={category.name} label="Name" {touched} error={errors.name} />
</Form>

<ButtonGroup>
  <Button name="Save" icon="save" on:click={submit} />
  <Button name="Discard" icon="close" href="/categories" />
</ButtonGroup>