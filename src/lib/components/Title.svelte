<script>
  import Seo from "$lib/components/Seo.svelte";
  import { fly } from "svelte/transition";
  import Icon from "./Icon.svelte";

  export let title, back = false
</script>

<div class="title">
  {#if back}
  <button on:click={()=>history.go(-1)}><Icon size="1.8rem" icon="arrowLeft" /></button>
  {/if}
  <h1 in:fly|local={{ x: -20, duration: 150 }}>{title}</h1>
</div>

<Seo {title} />

<style>
  .title {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
  }
  h1 {
    font-family: var(--serif);
    font-size: 1.5rem;
  }
  button {
    display: flex;
    align-items: center;
  }
</style>