<script>
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Cart from "$lib/components/Cart.svelte";
  import CartSummary from "$lib/components/CartSummary.svelte";
  import PromoField from "$lib/components/PromoField.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
  import Layout from "$lib/components/Layout.svelte";
  import { session } from "$app/stores";
  import { cartItems } from "$lib/others/cart";

  export let promo = {}
</script>

<Title title="Cart" />

<Layout>
  
  <div slot="main">
    <!-- {#if $cartItems.length != 0} -->
    <Subtitle subtitle="Items" icon="shoppingCart" />
    <Cart items={$cartItems} />
    <CartSummary items={$cartItems} />
    <!-- {/if} -->
  </div>
  
  <div slot="related">
    {#if $cartItems.length != 0}
    <Subtitle subtitle="Promo Code" icon="coupon" />

    <PromoField {promo} />
  
    <Subtitle subtitle="Bill Summary" icon="bill" />
    <BillSummary {promo} items={$cartItems} />
    
    {/if}
    
    {#if $cartItems.length != 0}
    <ButtonGroup>
      {#if $session.user_id}
      <Button name="Checkout" href="/cart/checkout" icon="shoppingBag" />
      {:else}
      <Button name="Sign-In To Checkout" href="/user/login?next=/cart/checkout" icon="loginBox" />
      {/if}
    </ButtonGroup>
    {/if}
  </div>

</Layout>