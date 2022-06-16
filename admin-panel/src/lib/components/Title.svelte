<script>
  import { fly } from "svelte/transition";
  import Icon from "./Icon.svelte";
  import Seo from "./Seo.svelte";

  export let title, back = null, description = title, icon  = null
  export let below = null
</script>

<div class="title">

  <div class="left">
    {#if back}
    <a href="{back}">
      <Icon fill="var(--primary)" size="1.5rem" icon="arrowLeft" />
    </a>
    {/if}
    {#if icon}
    <Icon size="1.5rem" {icon} />
    {/if}
    <div>
      <h1 in:fly={{x: -20, duration: 150}}>{title}</h1>
      {#if below}
      <div class="below">{@html below}</div>
      {/if}
    </div>
  </div>

  <div class="right">
    <slot></slot>
  </div>

</div>

<Seo {title} {description} />

<style>
  .title {
    display: flex;
    margin-bottom: 20px;
    /* border: 1px solid red; */
  }
  a {
    display: flex;
    /* border: 1px solid blue; */
  }
  .left {
    display: flex;
    gap: 10px;
    /* align-items: center; */
  }
  h1 {
    font-family: var(--serif);
    font-size: 1.5rem;
  }
</style>