<script>
  import Seo from "$lib/components/Seo.svelte";

  export let title
</script>

<div class="title">
  <h1>{title}</h1>
</div>

<Seo {title} />

<style>
  .title {
    /* border: 1px solid red; */
    margin-bottom: 20px;
  }
  h1 {
    font-family: var(--serif);
    font-size: 1.5rem;
  }
</style>