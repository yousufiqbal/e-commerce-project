<script>
  import AddToCart from "$lib/components/AddToCart.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import ProductDetail from "$lib/components/ProductDetail.svelte";

  export let product = {}
</script>

<ProductDetail {product} />

<ButtonGroup>
  <AddToCart {product} />
</ButtonGroup>