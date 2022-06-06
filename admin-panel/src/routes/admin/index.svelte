<script>
import Subtitle from "$lib/components/Subtitle.svelte";

  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Admin" />

<Subtitle subtitle="Misc." />

<div class="links">
  <a href="/admin/constants">Constants</a>
</div>

<style>
  .links {
    display: grid;
  }
  .links a {
    color: blue;
  }
</style>