<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import Field from "$lib/components/Field.svelte";
import Selector from "$lib/components/Selector.svelte";
import Textarea from "$lib/components/Textarea.svelte";
  import Title from "$lib/components/Title.svelte";
  import { capitalize } from 'lodash-es'

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Address', href: '/account/address' },
    { name: 'Add Address', href: '/account/address/add-address' },
  ]

  const labels = [
    { name: 'Home', url_name: 'home' },
    { name: 'Company', url_name: 'company' },
    { name: 'Office', url_name: 'office' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="{capitalize($page.params.mode)} Address"></Title>

<Field name="raa" face="radio" label="Choose Label *" items={labels} idColumn="url_name" valueColumn="name" />
<Field label="Address *" face="textarea" />

<ButtonGroup>
  <Button href="/account/address/add-address" name="Add New Address" icon="save" />
</ButtonGroup>