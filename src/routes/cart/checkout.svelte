<script>
  import Address from "$lib/components/Address.svelte";
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import DebitCard from "$lib/components/DebitCard.svelte";
  import Methods from "$lib/components/Methods.svelte";
  import PromoField from "$lib/components/PromoField.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  let paymentMethod = 'cod'

  const crumbs = [
    { name: 'Cart', href: '/cart' },
    { name: 'Checkout', href: '/cart/checkout' },
  ]

</script>
<Breadcrumb {crumbs} />

<Title back title="Checkout" />

<Subtitle icon="mapPinTwo" subtitle="Delivery Address" />

<Address />

<Subtitle icon="currency" subtitle="Payment Method" />

<Methods bind:paymentMethod />

{#if paymentMethod == 'card'}
<Subtitle icon="bankCard" subtitle="Card Details *" />
<DebitCard />
{/if}

<Subtitle icon="coupon" subtitle="Promo Code" />

<PromoField />

<Subtitle icon="bill" subtitle="Bill Summary" />

<BillSummary />


<ButtonGroup>
  <Button name="Confirm Order" href="/cart/confirm" icon="checkDouble" />
</ButtonGroup>

