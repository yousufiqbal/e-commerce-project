<script>
  import Seo from "$lib/components/Seo.svelte";
  import { onMount } from "svelte";
  import { fly } from "svelte/transition";
  import Icon from "./Icon.svelte";

  let referrer

  onMount(() => {
    referrer = document.referrer
  })

  export let title, back = ''
</script>

<div class="title">
  {#if back}
  <a href="{back === true ? referrer : back}"><Icon size="2rem" icon="arrowLeft" /></a>
  {/if}
  <h1 in:fly={{ x: -20, duration: 150 }}>{title}</h1>
</div>

<Seo {title} />

<style>
  .title {
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
  }
  h1 {
    font-family: var(--serif);
    font-size: 1.5rem;
  }
  a {
    display: flex;
    align-items: center;
  }
</style>