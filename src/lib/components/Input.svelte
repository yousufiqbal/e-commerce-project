<script>
  import { kebabCase } from "lodash-es";

  export let span = 'span 1'
  export let label
  let name = kebabCase(label)
  export let type = 'text', inputmode = 'text'
  export let touched = false, error = null
  export let value = undefined

  const typeMe = node => {
    node.type = type
  }
</script>

<div style:grid-column={span} class="input">
  <input bind:value on:blur={()=>touched=true} size="1" {inputmode} placeholder="{label}" {name} id="{name}" use:typeMe>
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
    text-transform: capitalize;
    color: red;
    padding-top: 7px;
    /* padding: 7px 15px 0 15px; */
    /* padding: var(--padding); */
  }
</style>