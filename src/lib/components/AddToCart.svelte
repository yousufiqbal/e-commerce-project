<script>
  import Counter from "$lib/components/Counter.svelte";
  import { cartItemsStore } from "$lib/others/store";
import { axios } from "$lib/others/utils";
  import { onMount  } from "svelte";
  import Modal from "./Modal.svelte";
  import SmallButton from "./SmallButton.svelte";
  import SmallButtonGroup from "./SmallButtonGroup.svelte";
  import Subtitle from "./Subtitle.svelte";
  import Text from "./Text.svelte";

  onMount(() => {
    counts = $cartItemsStore.filter(i => i.product_id == product.product_id)[0]?.quantity || 0
  })

  /**@type {Product}*/
  export let product = {}
  let counts = 0
  let modal = false

  // const addToCart = () => {
    
  // }

  const increase = async () => {
    if (counts > product.fair_limit || counts > product.stock) return
    try {
      // Is item already inside?
      // If it is already just check fair/stock limit and then increase quantity only
      counts++
      const index = $cartItemsStore.map(item => item.product_id).indexOf(product.product_id);
      if (index != -1) {
        // TODO check fair and stock limit here
        $cartItemsStore[index].quantity += 1
        await axios.put('/api/carts?product_id=' + product.product_id)
      } else {
        // TODO check fair and stock limit here
        $cartItemsStore.push({
          product_id: product.product_id,
          name: product.name,
          url_name: product.url_name,
          price: product.price,
          quantity: 1,
        })
        $cartItemsStore = $cartItemsStore
        await axios.post('/api/carts?product_id=' + product.product_id)
      }
      // If not
      // add item and quantity after checking fair/stock limit
    } catch (error) {
      console.log(error)
      // On failure revert your changes here
      counts--
      $cartItemsStore.pop()
      $cartItemsStore = $cartItemsStore
    }
  }

  const decrease = () => {
    if (counts == 0) return
    counts--
  }

  const notify = () => {
    modal = true
  }

  const close = () => {
    modal = false
  }

  const undoNotify = () => {

  }
</script>

<div class="add-to-cart">

  {#if product.stock != 0}

    {#if counts == 0}
    <button on:click={increase}>Add To Cart</button>
    {:else}
    <Counter on:increase={increase} on:decrease={decrease} {counts} />
    {/if}

  {:else}
    <button on:click={notify}>Notify Me</button>
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

<style>
  .add-to-cart {
    display: grid;
  }
  .add-to-cart > button {
    border-radius: 5px;
    background-color: rgb(255, 240, 212);
    flex: 1;
    border: 1px solid var(--border);
    padding: 7px 0;
  }
</style>