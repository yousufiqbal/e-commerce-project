<script>
import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Button from "$lib/components/Button.svelte";
import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import Checkbox from "$lib/components/Checkbox.svelte";
import Field from "$lib/components/Field.svelte";
import Form from "$lib/components/Form.svelte";
import Title from "$lib/components/Title.svelte";
import dayjs from "dayjs";

  let checked = true
  let backup = {}, touched = false, errors = {}

  const crumbs = [
    { name: 'Backups', href: '/backups', icon: "databaseTwo" },
    { name: 'Add Backup', href: '/backups/add-backup' },
  ]

  const autoNameFile = () => {
    backup.name = 'Fast Backup - ' + dayjs().format('MMM DD, YYYY HH.mm')
  }

  $: if (checked == true) autoNameFile()
</script>

<Title title="Add Backup" back="/backups" />

<Breadcrumb {crumbs} />

<Checkbox label="Name Automatically"  bind:checked />

<Form>
  <Field bind:value={backup.name} disabled={checked} label="Filename" />
</Form>

<ButtonGroup>
  <Button type="primary" icon="save" name="Backup" />
  <Button icon="close" name="Discard" href="/backups" />
</ButtonGroup>

