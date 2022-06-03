<script>
import { dev } from "$app/env";

import { invalidate } from "$app/navigation";

  import Addresses from "$lib/components/Addresses.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Title from "$lib/components/Title.svelte";
  import { loading } from "$lib/others/store";
  import { addToast } from "$lib/others/toast";
  import { axios } from "$lib/others/utils";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Address', href: '/account/address' },
  ]

  const makeDefault = async e => {
    try {
      $loading = true
      await axios.put('/api/address/make-default?address_id=' + e.detail.address_id)
      await invalidate('/account/address')
      addToast({ type: 'success', message: 'Changed default address' })
    } catch (error) {
      addToast({ type: 'error', message: 'Cannot change default address' })
    } finally {
      $loading = false
    }
  }

  export let addresses = []
</script>

<Breadcrumb {crumbs} />
<Title back title="Address"></Title>

<Addresses on:make-default={makeDefault} {addresses} />

<ButtonGroup>
  <Button href="/account/address/add-address" name="Add New Address" icon="add" />
</ButtonGroup>