<script>
  import { showDrawer } from "$lib/stores/misc";
  import { fly } from "svelte/transition";
</script>

<!-- {#if $showDrawer} -->
<div transition:fly|local={{ x: -20, duration: 120 }} class="drawer">
  <slot></slot>
</div>
<!-- {/if} -->

<style>
  .drawer {
    padding-top: 50px;
    z-index: 1;
    /* position: fixed; */
    top: 0; left: 0;
    width: 200px; height: 100vh;
    border-right: 1px solid var(--border);
    box-shadow: var(--shadow);
    background-color: #fff;
  }
</style>