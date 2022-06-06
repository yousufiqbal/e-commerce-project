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

  let category = {}, touched = false, errors = {}

  const mode = $page.params.mode
  const crumbs = [
    { name: 'Categories', href: '/categories', icon: 'folders' },
    { name: 'Add Category', href: '/categories/add-category' },
  ]

  const validate = async () => {
    try {
      await categorySchema.validate(category, { abortEarly: false })
      error = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if (mode == 'add') await addCategory()
      if (mode == 'edit') await editCategory()
    } else {
      touched = true
    }
  }

  // $: if (category) validate()
</script>

<Breadcrumb {crumbs} />
<Title back="/categories" title="{startCase(mode)} Category" />

<Form>
  <Input label="Name" {touched} error={errors['name']} />
</Form>

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Save" type="primary" />
  <Button href="/categories" icon="deleteBin" name="Discard" />
</ButtonGroup>