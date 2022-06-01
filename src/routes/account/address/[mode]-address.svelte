<script>
import { dev } from "$app/env";

import { goto } from "$app/navigation";

  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Field from "$lib/components/Field.svelte";
  import FieldGroup from "$lib/components/FieldGroup.svelte";
  import Input from "$lib/components/Input.svelte";
import Modal from "$lib/components/Modal.svelte";
  import Radios from "$lib/components/Radios.svelte";
import SmallButton from "$lib/components/SmallButton.svelte";
import SmallButtonGroup from "$lib/components/SmallButtonGroup.svelte";
import Spaced from "$lib/components/Spaced.svelte";
import Subtitle from "$lib/components/Subtitle.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";
  import { addressSchema, extractYupErrors } from "$lib/others/schema";
  import { axios } from "$lib/others/utils";
  import { capitalize } from 'lodash-es'

  export let address = { label: 'home' }
  let touched = false, errors = {}
  let deleteModal = false

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Address', href: '/account/address' },
    { name: `${capitalize($page.params.mode)} Address`, href: `/account/address/${$page.params.mode}-address` },
  ]

  const labels = [
    { name: 'Home', url_name: 'home' },
    { name: 'Office', url_name: 'office' },
    { name: 'Company', url_name: 'company' },
  ]

  const validate = async () => {
    try {
      await addressSchema.validate(address, { abortEarly: false })
      errors = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const addAddress = async () => {
    try {
      await axios.post('/api/address', address)
      goto('/account/address')
    } catch (error) {
      if (dev) console.log(error)
      alert('Cannot add address')
    }
  }

  const editAddress = async () => {
    try {
      await axios.put('/api/address?address_id=' + $page.url.searchParams.get('address_id'), address)
      goto('/account/address')
    } catch (error) {
      if (dev) console.log(error)
      alert('Cannot add address')
    }
  }

  const submit = async () => {
    if (Object.keys(errors).length != 0) {
      touched = true; return
    } else {
      if ($page.params.mode == 'add') await addAddress()
      if ($page.params.mode == 'edit') await editAddress()
    }
  }

  const removeAddress = async () => {
    try {
      deleteModal = false
      await axios.delete('/api/address?address_id=' + $page.url.searchParams.get('address_id'))
      goto('/account/address')
    } catch (error) {
      if (dev) console.log(error)
      alert('Cannot remove address')
    }
  }

  const close = () => {
    deleteModal = false
  }

  $: if (address) validate()
</script>

<Breadcrumb {crumbs} />

<Title back title="{capitalize($page.params.mode)} Address"></Title>

<FieldGroup>
  <Radios bind:value={address.label} items={labels} />
  <Input {touched} error={errors.city} bind:value={address.city} label="City" />
  <Input {touched} error={errors.address} bind:value={address.address} label="Address" />
  <Text>
    * All fields are required
  </Text>
</FieldGroup>


<ButtonGroup columns={ $page.params.mode == 'edit' ? '2fr 1fr' : '1fr'}>
  <Button on:click={submit}  name="Save Address" icon="save" />
  {#if $page.params.mode == 'edit'}
  <Button on:click={()=>deleteModal=true} type="general"  name="Delete" icon="deleteBin" />
  {/if}
</ButtonGroup>

{#if deleteModal}
<Modal on:close={close}>
  <Subtitle subtitle="Delete This?" />
  <Text>
    Are you sure you want to delete this address?
  </Text>
  <Spaced>
    <SmallButton icon="check" name="Yes" on:click={removeAddress} />
    <SmallButton icon="close" name="No" on:click={close} />
  </Spaced>
</Modal>
{/if}