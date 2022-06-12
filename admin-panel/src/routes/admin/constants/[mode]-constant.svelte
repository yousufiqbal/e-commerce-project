<script>
import { goto } from "$app/navigation";

  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import DeleteThis from "$lib/components/DeleteThis.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import Title from "$lib/components/Title.svelte";
  import { constantSchema, extractYupErrors } from "$lib/others/schema";
import { axios } from "$lib/others/utils";
import { addToast } from "$lib/stores/toast";
  import { isEmpty, startCase } from "lodash-es";

  export let constant = { name: '', value: '' }
  let touched = false, errors = {}

  const crumbs = [
    { name: 'Admin', href: '/admin', icon: 'admin' },
    { name: 'Constants', href: '/admin/constants' },
    { name: `${startCase($page.params.mode)} Constant`, href: `/admin/constants/${$page.params.mode}-constant` },
  ]

  const validate = async () => {
    try {
      await constantSchema.validate(constant, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if ($page.params.mode == 'add') addConstant()
      if ($page.params.mode == 'edit') editConstant()
    } else {
      touched = true
    }
  }

  const addConstant = async () => {
    try {
      const response = await axios.post('/api/constants', constant)
      addToast({ message: response.data.message })
      goto('/admin/constants')
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot add constant', type: 'error' })
    }
  }

  const editConstant = async () => {
    try {
      const response = await axios.put('/api/constants?constant_id='+$page.url.searchParams.get('constant_id'), constant)
      addToast({ message: response.data.message })
      goto('/admin/constants')
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot edit constant', type: 'error' })
    }
  }

  const removeConstant = async () => {
    try {
      const response = await axios.delete('/api/constants?constant_id='+$page.url.searchParams.get('constant_id'))
      addToast({ message: response.data.message })
      goto('/admin/constants')
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot remove constant', type: 'error' })
    }
  }

  $: if (constant) validate()
</script>

<Title back="/admin/constants" title="{startCase($page.params.mode)} Constant" />

<Breadcrumb {crumbs} />

<Form>
  <Field {touched} error={errors.name} bind:value={constant.name} label="Name" />
  <Field {touched} error={errors.value} bind:value={constant.value} label="Value" />
</Form>

<ButtonGroup>
  <Button shortcut="ctrl+enter" on:click={submit} icon="save" name="Save" type="primary" />
  <Button icon="close" name="Discard" href="/admin/constants" />
</ButtonGroup>

{#if $page.params.mode == 'edit'}
<DeleteThis on:yes={removeConstant} />
{/if}