<script>
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