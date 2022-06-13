<script>
  export let error = null
</script>

{#if error}
<div class="error">
  {error}
</div>
{/if}

<style>
  .error {
    color: red;
  }
</style>