<script>
  import AddToCart from "$lib/components/AddToCart.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import Modal from "$lib/components/Modal.svelte";
  import ProductDetail from "$lib/components/ProductDetail.svelte";
import SmallButton from "$lib/components/SmallButton.svelte";
import SmallButtonGroup from "$lib/components/SmallButtonGroup.svelte";
import Subtitle from "$lib/components/Subtitle.svelte";
import Text from "$lib/components/Text.svelte";

  export let product = {}
  let modal = false

  const close = () => {
    modal = false
  }

  const show = () => {
    modal = true
  }
</script>

<ProductDetail {product} />

<ButtonGroup>
  {#if product.stock != 0}
  <AddToCart product_id="{product.product_id}" />
  {:else}
  <Button on:click={show} icon="notificationThree" name="Notify Me" />
  {/if}
</ButtonGroup>

{#if modal}
<Modal on:close={close}>
  <Subtitle subtitle="Notify Alert Added" />
  <Text>
    In-sha-Allah, you will be notified, when this product is available 
  </Text>
  <SmallButtonGroup>
    <SmallButton on:click={close} icon="check" name="Alright" />
  </SmallButtonGroup>
</Modal>
{/if}