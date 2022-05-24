<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import CartItem from "$lib/components/CartItem.svelte";
  import CartItemGroup from "$lib/components/CartItemGroup.svelte";
  import CartSummary from "$lib/components/CartSummary.svelte";
  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Cart" />

<CartItemGroup>
  <CartItem />
  <CartItem />
  <CartItem />
</CartItemGroup>

<CartSummary />

<ButtonGroup>
  <Button name="Checkout" href="/cart/checkout" icon="shoppingBag" />
</ButtonGroup>