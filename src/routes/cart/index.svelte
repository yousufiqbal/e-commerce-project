<script>
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Cart from "$lib/components/Cart.svelte";
  import CartSummary from "$lib/components/CartSummary.svelte";
  import PromoField from "$lib/components/PromoField.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  let items = []
</script>

<Title title="Cart" />

<Subtitle subtitle="Items" icon="shoppingCart" />
<Cart />
<CartSummary bind:items />

<Subtitle subtitle="Promo Code" icon="coupon" />
<PromoField />

<Subtitle subtitle="Bill Summary" icon="bill" />
<BillSummary {items} />

<ButtonGroup>
  <Button name="Sign-In To Checkout" href="/account/sign-in?next=/cart/checkout" icon="shoppingBag" />
</ButtonGroup>