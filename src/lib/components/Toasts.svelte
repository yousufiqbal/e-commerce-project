<script>
  import { removeToast, toasts } from "$lib/others/toast";
  import { fly } from "svelte/transition";
  import Icon from "./Icon.svelte";

  const iconsMap = {
    success: 'checkboxCircle',
    error: 'errorWarning',
    info: 'information',
  }
</script>

{#if $toasts.length != 0}
<div class="toasts">

  {#each $toasts as toast (toast.id)}
  <div transition:fly={{y: -20, duration: 100}} class="toast">

    <Icon size="1.2rem" icon={iconsMap[toast.type]} />
    <div class="message">{toast.message}</div>
    {#if toast.dismissible}
    <button on:click={() => removeToast(toast.id)}>
      <Icon icon="close" />
    </button>
    {/if}
    <div style:animation-duration="{toast.timeout}ms" class="border"></div>

  </div>
  {/each}
  
</div>
{/if}

<style>
  .border {
    position: absolute;
    width: 0%;
    border-bottom: 2px solid red;
    bottom: 0; left: 0;
    animation: hero ease-in-out;
  }
  @keyframes hero {
    from { width: 0%; }
    to { width: 100%; }
  }
  .toasts {
    z-index: 1;
    top: 20px; right: 20px;
    position: fixed;
    display: grid;
    justify-items: right;
    gap: 20px;
    /* border: 1px solid red; */
  }
  .toast {
    position: relative;
    gap: 10px;
    background-color: rgb(255, 255, 255);
    padding: var(--padding);
    display: flex;
    align-items: center;
    border: 1px solid var(--border);
    border-radius: 5px;
    box-shadow: var(--shadow);
    /* color: white; */
  }
  .message {
    
  }
  button {
    color: white;
    background-color: rgb(65, 65, 65);
    display: flex;
    border-radius: 50%;
  }
</style>