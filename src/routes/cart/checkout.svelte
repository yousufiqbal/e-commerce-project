<script>
  import Address from "$lib/components/Address.svelte";
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import DebitCard from "$lib/components/DebitCard.svelte";
  import Layout from "$lib/components/Layout.svelte";
  import Methods from "$lib/components/Methods.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
  import { cartItemsStore } from "$lib/others/store";

  let paymentMethod = 'cod'
  export let address = {}

  const crumbs = [
    { name: 'Cart', href: '/cart' },
    { name: 'Checkout', href: '/cart/checkout' },
  ]

  console.log(address)
</script>

<Breadcrumb {crumbs} />

<Title back title="Checkout" />

<Layout>
  <div slot="main">
    <Subtitle icon="mapPinTwo" subtitle="Delivery Address" />
    <Address {address} />
    
    <Subtitle icon="currency" subtitle="Payment Method" />
    <Methods bind:paymentMethod />
    {#if paymentMethod == 'card'}
    <Subtitle icon="bankCard" subtitle="Card Details *" />
    <DebitCard />
    {/if}
  </div>
  <div slot="related">
    <Subtitle icon="bill" subtitle="Bill Summary" />
    <BillSummary items={$cartItemsStore} />
    
    <ButtonGroup>
      <Button name="Confirm Order" href="/cart/confirm" icon="checkDouble" />
    </ButtonGroup>
  </div>
</Layout>



<!-- <Subtitle icon="coupon" subtitle="Promo Code" />
<PromoField /> -->
