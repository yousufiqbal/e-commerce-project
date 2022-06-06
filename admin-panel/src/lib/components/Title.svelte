<script>
  import Icon from "./Icon.svelte";
  import Seo from "./Seo.svelte";

  export let title, back = null, description = title
</script>

<div class="title">

  <div class="left">
    {#if back}
    <a href="{back}">
      <Icon fill="var(--primary)" size="1.3rem" icon="arrowLeft" />
    </a>
    {/if}
    <h1>{title}</h1>
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
    font-size: 1.3rem;
  }
</style>