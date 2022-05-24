<script>
  import Counter from "./Counter.svelte";

  export let counts = 0

  const increase = () => {
    counts++
  }
</script>

<div class="add-to-cart">
  {#if counts == 0}
  <button on:click={increase}>Add To Cart</button>
  {:else}
  <Counter bind:counts />
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