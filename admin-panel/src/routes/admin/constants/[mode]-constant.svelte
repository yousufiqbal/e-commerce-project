<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import Title from "$lib/components/Title.svelte";
  import { startCase } from "lodash-es";

  let constant = {}, touched = false, errors = {}

  const mode = startCase($page.params.mode)

  const crumbs = [
    { name: 'Admin', href: '/admin', icon: 'admin' },
    { name: 'Constants', href: '/admin/constants' },
    { name: `${mode} Constant`, href: `/admin/constants/${mode.toLowerCase()}-constant` },
  ]
</script>

<Title back="/admin/constants" title="{mode} Constant" />

<Breadcrumb {crumbs} />

<Form>
  <Field {touched} error={errors.name} bind:value={constant.name} label="Name" />
  <Field {touched} error={errors.value} bind:value={constant.value} label="Value" />
</Form>

<ButtonGroup>
  <Button icon="save" name="Save" type="primary" />
  <Button icon="close" name="Discard" href="/admin/constants" />
</ButtonGroup>