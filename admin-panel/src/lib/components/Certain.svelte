<script>
  export let certain = ''
  export let placeholder = null
</script>

<div class="wrapper">
  <input bind:value={certain} {placeholder} class="input">
</div>

<style>
  .wrapper {
    display: grid;
  }
  .input {
    border: 1px solid var(--border);
    padding: var(--padding);
    border-radius: 4px;
    flex: 1;
  }
</style>