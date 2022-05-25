<script>
  import Addresses from "$lib/components/Addresses.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Address', href: '/account/address' },
  ]
</script>

<Breadcrumb {crumbs} />
<Title back title="Address"></Title>

<Addresses />

<ButtonGroup>
  <Button href="/account/address/add-address" name="Add New Address" icon="add" />
</ButtonGroup>