<script>
  import Counter from "$lib/components/Counter.svelte";
import Modal from "./Modal.svelte";
import SmallButton from "./SmallButton.svelte";
import SmallButtonGroup from "./SmallButtonGroup.svelte";
import Subtitle from "./Subtitle.svelte";
import Text from "./Text.svelte";

  /**@type {Product}*/
  export let product = {}
  export let counts = 0

  let modal = false

  const updateCart = () => {

  }

  const increase = () => {
    if (counts > product.fair_limit || counts > product.stock) return
    counts++
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