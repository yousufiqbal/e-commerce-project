<script>
import Address from "$lib/components/Address.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Button from "$lib/components/Button.svelte";
import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import CartSummary from "$lib/components/CartSummary.svelte";
import Methods from "$lib/components/Methods.svelte";
import PromoField from "$lib/components/PromoField.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";


  const crumbs = [
    { name: 'Cart', href: '/cart' },
    { name: 'Checkout', href: '/cart/checkout' },
  ]
    let items = [
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 1, stock: 3 },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 2, stock: 5 },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 3, stock: 10 },
  ]
</script>
<Breadcrumb {crumbs} />

<Title back title="Checkout" />

<Subtitle subtitle="Address" />

<Address />

<Subtitle subtitle="Payment Method" />

<Methods />

<Subtitle subtitle="Promo Code" />

<PromoField />

<Subtitle subtitle="Bill Summary" />

<CartSummary {items} />

<ButtonGroup>
  <Button name="Confirm Order" href="/cart/confirm" icon="checkDouble" />
</ButtonGroup>

