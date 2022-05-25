<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Title from "$lib/components/Title.svelte";
  import { capitalize } from 'lodash-es'

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Address', href: '/account/address' },
    { name: 'Add Address', href: '/account/address/add-address' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="{capitalize($page.params.mode)} Address"></Title>

<ButtonGroup>
  <Button href="/account/address/add-address" name="Add New Address" icon="save" />
</ButtonGroup>