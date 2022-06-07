<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import Title from "$lib/components/Title.svelte";
  import { startCase } from "lodash-es";

  const mode = startCase($page.params.mode)
  let subcategory = {}, touched = false, errors = {}

  const crumbs = [
    { name: 'Categories', href: '/categories' },
    { name: mode + ' Subcategory', href: `/categories/${$page.params.mode}-subcategory` },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back="/categories" title="{mode} Subcategory" />

<Form>
  <Field bind:value={subcategory.category_id} {touched} error={errors.category_id} label="Inside" />
  <Field bind:value={subcategory.name} {touched} error={errors.name} label="Name" />
</Form>

<ButtonGroup>
  <Button icon="save" name="Save" type="primary" />
  <Button icon="close" name="Discard" href="/categories" />
</ButtonGroup>