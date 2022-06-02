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
  import Layout from "$lib/components/Layout.svelte";
  import { session } from "$app/stores";

  export let promo = {}
</script>

<Title title="Cart" />

<Layout>
  
  <div slot="main">
    {#if $cartItemsStore.length != 0}
    <Subtitle subtitle="Items" icon="shoppingCart" />
    <Cart />
    <CartSummary items={$cartItemsStore} />
    {/if}
  </div>
  
  <div slot="related">
    {#if $cartItemsStore.length != 0}
    <Subtitle subtitle="Promo Code" icon="coupon" />

    <PromoField {promo} />
  
    <Subtitle subtitle="Bill Summary" icon="bill" />
    <BillSummary {promo} items={$cartItemsStore} />
    
    {:else}
    <Nothing>
      No Items in Cart
    </Nothing>
    {/if}
    
    {#if $cartItemsStore.length != 0}
    <ButtonGroup>
      {#if $session.user_id}
      <Button name="Checkout" href="/cart/checkout" icon="shoppingBag" />
      {:else}
      <Button name="Sign-In To Checkout" href="/account/sign-in?next=/cart/checkout" icon="loginBox" />
      {/if}
    </ButtonGroup>
    {/if}
  </div>

</Layout>