<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Button from "$lib/components/Button.svelte";
import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Cart', href: '/cart' },
    { name: 'Checkout', href: '/cart/checkout' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Checkout" />

<Subtitle subtitle="Address" />
<Subtitle subtitle="Payment Method" />
<Subtitle subtitle="Promo Code" />
<Subtitle subtitle="Bill Summary" />

<ButtonGroup>
  <Button name="Confirm Order" href="/cart/confirm" icon="checkDouble" />
</ButtonGroup>