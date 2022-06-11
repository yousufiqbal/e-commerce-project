<script>
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import Title from "$lib/components/Title.svelte";
  import { parentSchema, extractYupErrors } from "$lib/others/schema";
  import { axios } from "$lib/others/utils";
  import { addToast } from "$lib/stores/toast";
  import { isEmpty } from "lodash-es";

  let parent = { name: '', url_name: '' }
  let touched = false, errors = {}

  const crumbs = [
    { name: 'Categories', href: '/categories' },
    { name: 'Add Parent', href: '/categories/add-parent' },
  ]

  const submit = async () => {
    if (isEmpty(errors)) {
      if ($page.params.mode == 'add') addParent()
      if ($page.params.mode == 'edit') editParent()
    } else {
      touched = true
    }
  }

  const validate = async () => {
    try {
      await parentSchema.validate(parent, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
      
    }
  }

  const addParent = async () => {
    try {
      const response = await axios.post('/api/categories/parents', parent)
      addToast({ message: response.data.message, type: 'success'})
      goto('/categories')
    } catch (error) {
      addToast({ message: 'Cannot add parent', type: 'error'})
    }
  }

  // Validation
  $: if (parent) validate()
</script>

<Breadcrumb {crumbs} />
<Title back title="Add Parent" />

<Form>
  <Field bind:value={parent.name} label="Parent Name" {touched} error={errors.name} />
</Form>

<ButtonGroup>
  <Button name="Save" icon="save" on:click={submit} />
  <Button name="Discard" icon="close" href="/categories" />
</ButtonGroup>