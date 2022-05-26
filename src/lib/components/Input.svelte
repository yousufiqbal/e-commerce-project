<script>
  export let span = 'span 1'
  export let label, name
  export let type = 'text', inputmode = 'text'
  export let touched = false, error = null

  const typeMe = node => {
    node.type = type
  }
</script>

<div style:grid-column={span} class="input">
  <input on:blur={()=>touched=true} size="1" {inputmode} placeholder="{label}" {name} id="{name}" use:typeMe>
  {#if touched && error}
  <div class="error">{error}</div>
  {/if}
</div>

<style>
  .input {
    display: grid;
    gap: 5px;
    /* border: 1px solid red; */
  }
  input {
    border-radius: 5px;
    border: 1px solid var(--border);
    padding: var(--padding-extra);
    box-shadow: var(--shadow);
    border: 1px s;
  }
  .error {
    color: red;
    /* padding: var(--padding); */
  }
</style>