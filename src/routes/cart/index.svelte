<script>
import BillSummary from "$lib/components/BillSummary.svelte";

  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Cart from "$lib/components/Cart.svelte";
  import CartSummary from "$lib/components/CartSummary.svelte";
import PromoField from "$lib/components/PromoField.svelte";
import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  let items = [
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 1, stock: 3 },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 2, stock: 5 },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 3, stock: 10 },
  ]
</script>

<Title title="Cart" />

<Subtitle subtitle="Items" icon="shoppingCart" />
<Cart bind:items />
<!-- <CartSummary {items} /> -->

<Subtitle subtitle="Promo" icon="coupon" />
<PromoField />

<Subtitle subtitle="Bill Summary" icon="bill" />
<BillSummary />

<ButtonGroup>
  <Button name="Sign-In To Checkout" href="/account/sign-in?next=/cart/checkout" icon="shoppingBag" />
</ButtonGroup>