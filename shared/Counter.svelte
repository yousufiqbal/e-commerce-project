<script>
  import Icon from "$lib/components/Icon.svelte";
  import { createEventDispatcher } from "svelte";

  const dispatch = createEventDispatcher()
  export let quantity = 0
</script>

<div class="counter">
  <button on:click={()=>dispatch('decrease')}><Icon size="1.3rem" icon="{quantity <= 1? 'deleteBin' : 'subtract'}" /></button>
  <div class="quantity">{quantity}</div>
  <button on:click={()=>dispatch('increase')}><Icon size="1.3rem" icon="add" /></button>
</div>

<style>
  .counter {
    display: flex;
    align-items: center;
    border: 1px solid var(--border);
  }
  .quantity {
    min-width: 35px;
    font-weight: bold;
    flex: 1;
    text-align: center;
  }
  button {
    padding: 7px;
    display: flex;
  }
  button:first-child {
    border-right: 1px solid var(--border);
  }
  button:last-child {
    border-left: 1px solid var(--border);
  }
  button:hover {
    color: red;
  }
</style>