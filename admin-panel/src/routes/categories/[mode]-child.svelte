<script>
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import Modal from "$lib/components/Modal.svelte";
  import Title from "$lib/components/Title.svelte";
  import { childSchema, extractYupErrors } from "$lib/others/schema";
  import { axios } from "$lib/others/utils";
  import { addToast } from "$lib/stores/toast";
  import { isEmpty, startCase } from "lodash-es";

  let modal = false
  export let parent = {}
  export let child = {
    parent_id: parent.category_id,
    name: ''
  }
  let errors = {}, touched = false

  const crumbs = [
    { name: 'Categories', href: '/categories', icon: 'folders' },
    { name: `${startCase($page.params.mode)} Child`, href: `/categories/${$page.params.mode}-child` },
  ]

  const validate = async () => {
    try {
      await childSchema.validate(child, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    try {
      if (isEmpty(errors)) {
        if ($page.params.mode == 'add') addChild()
        if ($page.params.mode == 'edit') editChild()
      }
    } catch (error) {
      touched = true
    }
  }

  const addChild = async () => {
    try {
      const response = await axios.post('/api/categories/children', child)
      addToast({ type: 'success', message: response.data.message })
      goto('/categories')
    } catch (error) {
      addToast({ type: 'error', message: error.data.message })
    }
  }

  $: if (child) validate()
</script>

<Breadcrumb {crumbs} />
<Title back title="{startCase($page.params.mode)} Child" />

<Form>
  <Field label="Parent" value={parent.name} disabled />
  <Field label="Child" bind:value={child.name} {touched} error={errors.name} />
</Form>

<ButtonGroup>
  <Button icon="save" name="Save" type="primary" on:click={submit} />
  <Button icon="close" name="Discard" href="/categories" />
</ButtonGroup>

{#if modal}
<Modal on:close={()=>modal=false}>

</Modal>
{/if}