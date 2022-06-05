<script>
  import { cartItems } from "$lib/others/cart";
  import { addToast } from "$lib/others/toast";
  import { axios } from "$lib/others/utils";
  import { debounce } from "lodash-es";
  import Counter from "./Counter.svelte";
  import Modal from "./Modal.svelte";
  import SmallButton from "./SmallButton.svelte";
  import SmallButtonGroup from "./SmallButtonGroup.svelte";
  import Subtitle from "./Subtitle.svelte";
  import Text from "./Text.svelte";
  
  export let product = {}
  let modal = false

  const syncCart = debounce(async () => {
    try {
      const response = await axios.post('/api/carts/sync', $cartItems)
      $cartItems = response.data
    } catch (error) {
      addToast({ type: 'error', message: 'Unable to sync cart'})
    }
  }, 2000)

  const increase = async () => {
    cartItems.addItem(product)
    await syncCart()
  }
  
  const decrease = async () => {
    cartItems.removeItem(product)
    await syncCart()
  }
  
  const notify = () => { modal = true }
  const close = () => { modal = false }
  const undoNotify = () => {}

  $: quantity = $cartItems.filter(item => item.product_id == product.product_id)[0]?.quantity || 0
</script>

<div class="add-to-cart">

  {#if product.stock != 0}

    {#if quantity == 0}
    <button on:click={increase}>Add To Cart</button>
    {:else}
    <Counter {quantity} on:decrease={decrease} on:increase={increase} />
    {/if}

  {:else}
    <button class="notify" on:click={notify}>Notify Me</button>
  {/if}
  
</div>

{#if modal}
<Modal on:close={close}>

  <Subtitle subtitle="Notify Alert Added" />

  <Text>
    In-sha-Allah, you will be notified, when this product is available 
  </Text>

  <SmallButtonGroup>
    <SmallButton on:click={close} icon="check" name="Alright" />
    <SmallButton on:click={undoNotify} icon="arrowGoBack" name="Undo" />
  </SmallButtonGroup>
  
</Modal>
{/if}

<!-- {#if confirmDeleteModal}
<Modal on:close={close}>
  <Subtitle subtitle="Delete This?" icon="deleteBin" />
  <Text>
    Do you want to remove {product.name} from cart completely? 
  </Text>
  <Spaced>
    <SmallButton on:click={close} icon="check" name="Yes" />
    <SmallButton on:click={undoNotify} icon="close" name="No" />
  </Spaced>
</Modal>
{/if} -->

<style>
  .add-to-cart {
    display: grid;
  }
  button {
    border-radius: 5px;
    background-color: rgb(255, 240, 212);
    flex: 1;
    border: 1px solid var(--border);
    padding: 7px 0;
  }
  .notify {
    background-color: #fff;
  }
</style>