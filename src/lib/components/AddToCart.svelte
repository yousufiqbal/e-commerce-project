<script>
  import Counter from "$lib/components/Counter.svelte";

  export let product_id
  export let counts = 0
  export let limit = 100

  const updateCart = () => {

  }

  const increase = () => {
    if (counts >= limit) return
    counts++
  }

  const decrease = () => {
    if (counts == 0) return
    counts--
  }
</script>

<div class="add-to-cart">

  {#if counts == 0}
  <button on:click={increase}>Add To Cart</button>
  {:else}
  <Counter on:increase={increase} on:decrease={decrease} {counts} />
  {/if}

</div>

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