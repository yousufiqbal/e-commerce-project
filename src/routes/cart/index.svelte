<script>
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Cart from "$lib/components/Cart.svelte";
  import CartSummary from "$lib/components/CartSummary.svelte";
import Nothing from "$lib/components/Nothing.svelte";
  import PromoField from "$lib/components/PromoField.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
  import { cartItemsStore } from "$lib/others/store";

  // $: total = $cartItemsStore.map(item.price).reduce((a, b) => +a + +b, 0)
</script>

<Title title="Cart" />

{#if $cartItemsStore.length != 0}
<Subtitle subtitle="Items" icon="shoppingCart" />
<Cart />
<CartSummary items={$cartItemsStore} />

<Subtitle subtitle="Promo Code" icon="coupon" />
<PromoField />

<Subtitle subtitle="Bill Summary" icon="bill" />
<BillSummary items={$cartItemsStore} />
{:else}
<Nothing>
  No Items in Cart
</Nothing>
{/if}

<ButtonGroup>
  <Button name="Sign-In To Checkout" href="/account/sign-in?next=/cart/checkout" icon="shoppingBag" />
</ButtonGroup>