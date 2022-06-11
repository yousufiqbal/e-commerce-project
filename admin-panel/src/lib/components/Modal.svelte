<script>
  import { createEventDispatcher } from "svelte";
  import { fly } from "svelte/transition";
  import Card from "./Card.svelte";
  import Icon from "./Icon.svelte";

  export let close = true

  const dispatch = createEventDispatcher()

  const handleEscapeKey = e => {
    if (e.key == 'Escape') dispatch('close')
  }
</script>

<div class="wrapper">

  <!-- Modal Card -->
  <div transition:fly|local={{y: -20, duration: 150}} class="modal">
    
    <Card>
      <slot></slot>
    </Card>

    {#if close}
    <button on:click={()=>dispatch('close')} class="close-button">
      <Icon size="1.3rem" icon="close" />
    </button>
    {/if}

  </div>

</div>

<svelte:window on:keydown={handleEscapeKey} />

<style>
  .wrapper {
    z-index: 2;
    display: grid;
    place-items: center;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background-color: rgba(243, 243, 243, 0.7);
    /* border: 1px solid red; */
    padding: 20px;
  }
  .modal {
    position: relative;
    width: 100%;
    max-width: 450px;
  }
  .close-button {
    position: absolute;
    top: -10px; right: -10px;
    padding: 4px;
    display: flex;
    color: white;
    background-color: rgb(51, 51, 51);
    box-shadow: var(--shadow);
    border-radius: 50%;
    transition: background-color 400ms;
  }
  .close-button:hover {
    background-color: var(--primary);
  }
</style>