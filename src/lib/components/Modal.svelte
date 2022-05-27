<script>
  import { createEventDispatcher } from "svelte";
import { fly } from "svelte/transition";
  import Icon from "./Icon.svelte";

  const dispatch = createEventDispatcher()
</script>

<div class="wrapper">
  <div transition:fly|local={{y: 20, duration: 100}} class="modal card">
    <button on:click={()=>dispatch('close')} class="close">
      <Icon size="1.3rem" icon="close" />
    </button>
    <slot></slot>
  </div>
</div>

<style>
  .wrapper {
    background-color: rgba(225, 225, 225, 0.5);
    display: grid;
    place-items: center;
    z-index: 2;
    position: fixed;
    top: 0; left: 0; right: 0; bottom: 0;
    border: 1px solid red;
  }
  .modal {
    position: relative;
    background-color: #fff;
    width: 70%;
    min-height: 150px;
  }
  .close {
    /* border-top-right-radius: 5px; */
    padding: 4px;
    display: flex;
    color: white;
    background-color: rgb(54, 54, 54);
    border-radius: 50%;
    border: 1px solid var(--border);
    position: absolute;
    right: -15px; top: -15px;
  }
</style>