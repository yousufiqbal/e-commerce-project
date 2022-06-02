<script>
  import { dev } from "$app/env";
  import { goto } from "$app/navigation";
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
  import { axios } from "$lib/others/utils";

  let payment_method = 'cod'
  export let address = {}
  export let promo = {}

  const crumbs = [
    { name: 'Cart', href: '/cart' },
    { name: 'Checkout', href: '/cart/checkout' },
  ]

  const addOrder = async () => {
    try {
      const response = await axios.post('/api/orders', {
        address_id: address.address_id, payment_method
      })
      goto('/cart/order-confirmed?number=' + response.data.message)
    } catch (error) {
      if (dev) console.log(error)
      alert('Unable to add order')
    }
  }
</script>

<Breadcrumb {crumbs} />

<Title back title="Checkout" />

<Layout>
  <div slot="main">
    <Subtitle icon="mapPinTwo" subtitle="Delivery Address" />
    <Address {address} />
    
    <Subtitle icon="currency" subtitle="Payment Method" />
    <Methods bind:payment_method />
    {#if payment_method == 'card'}
    <Subtitle icon="bankCard" subtitle="Card Details *" />
    <DebitCard />
    {/if}
  </div>
  <div slot="related">
    <Subtitle icon="bill" subtitle="Bill Summary" />
    <BillSummary {promo} items={$cartItemsStore} />
    
    <ButtonGroup>
      <Button name="Confirm Order" on:click={addOrder} icon="checkDouble" />
    </ButtonGroup>
  </div>
</Layout>



<!-- <Subtitle icon="coupon" subtitle="Promo Code" />
<PromoField /> -->
