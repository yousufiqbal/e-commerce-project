<script>
  import { browser } from "$app/env";
  import { cartItemsStore } from "$lib/others/store";
  import { axios } from "$lib/others/utils";
  import Counter from "./Counter.svelte";
  import Modal from "./Modal.svelte";
  import SmallButton from "./SmallButton.svelte";
  import SmallButtonGroup from "./SmallButtonGroup.svelte";
  // import Spaced from "./Spaced.svelte";
  import Subtitle from "./Subtitle.svelte";
  import Text from "./Text.svelte";

  const syncCart = async () => {
    try {
      const response = await axios.get('/api/carts')
      $cartItemsStore = await response.data
    } catch (error) {
      $cartItemsStore = []
      alert('Cannot sync cart..')
    }
  }

  (async () => {
    if (browser) {
      await syncCart()
    }
  })();

  /**@type {Product}*/
  export let product = {}
  let modal = false
  let wait = false
  let quantity = 0;

  // let confirmDeleteModal = false
  // let removeLast = false


  $: if ($cartItemsStore) {
    quantity = $cartItemsStore.filter(i => i.product_id == product.product_id)[0]?.quantity || 0
  }

  const increase = async () => {
 
    try {
      if (wait) return
      wait = true
      
      // Validation..
      if (quantity >= product.fair_quantity || quantity >= product.stock) return
  
      // Index for checks..
      const index = $cartItemsStore.map(item => item.product_id).indexOf(product.product_id);
      
      if (index == -1) {
        // Adding New Item..
        $cartItemsStore.push({
          product_id: product.product_id,
          name: product.name,
          url_name: product.url_name,
          price: product.price,
          quantity: 1,
        })
        $cartItemsStore = $cartItemsStore
        await axios.post('/api/carts?product_id=' + product.product_id)
        
      } else {
        // Incrementing old item..
        $cartItemsStore[index].quantity += 1
        await axios.put('/api/carts?product_id=' + product.product_id)
      }

    } catch (error) {
      // Rollback..
      if (index == -1) {
        // Removing new item..
        const index2 = $cartItemsStore.map(item => item.product_id).indexOf(product.product_id);
        $cartItemsStore.splice(index2, 1)
        $cartItemsStore = $cartItemsStore
      } else {
        // Decrementing old item..
        $cartItemsStore[index].quantity--
      }

    } finally {
      // Syncing...
      await syncCart()
      wait = false
    }

  }

  const confirmRemoval = async () => {
    return new Promose()
  }

  const decrease = async () => {

    if (quantity == 1 && !await confirmRemoval()) return 

    try {


      if (wait) return
      wait = true
      
      // Index for checks..
      const index = $cartItemsStore.map(item => item.product_id).indexOf(product.product_id);
      // Invalid item (less possible..)
      if (index == -1) return
      // Old Item
      if ($cartItemsStore[index].quantity >= 2) {

        // If +1 quantity just decrease
        $cartItemsStore[index].quantity--
      } else {

        // else remove..
        $cartItemsStore.splice(index, 1)
        $cartItemsStore = $cartItemsStore
      }

      await axios.delete('/api/carts?product_id=' + product.product_id)

    } catch (error) {

      // Rollback..
      $cartItemsStore[index].quantity++
      
    } finally {
      await syncCart()
      wait = false
    }

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