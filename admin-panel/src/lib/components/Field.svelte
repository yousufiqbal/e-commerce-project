<script>
  import { kebabCase } from "lodash-es";

  export let label, name = kebabCase(label)
  export let el = null
  export let type = 'text' 
  export let touched = false, error = ''
  export let value = undefined

  const typeMe = node => {
    node.type = type
  }
</script>

<div class="field">
  <div class="label-input">
    <label for="{name}">{label}</label>
    <input bind:value size="1" bind:this={el} spellcheck="false" autocomplete="off" id="{name}" {name} use:typeMe on:blur={()=>touched=true} type="text">
  </div>
  {#if touched && error}
  <div class="error">{error}</div>
  {/if}
</div>

<style>
  .field {
    display: grid;
  }
  .field:last-child {
    border-bottom: 1px solid var(--border);
  }
  .error {
    color: red;
    padding: var(--padding);
    border-top: 1px solid var(--border);
    border-left: 1px solid var(--border);
    border-right: 1px solid var(--border);
  }
  .label-input {
    display: grid;
    grid-template-columns: 2fr 4fr;
    border: 1px solid var(--border);
    border-bottom: none;
  }
  label {
    background-color: rgb(248, 248, 248);
    padding: var(--padding);
    /* border: 1px solid green; */
  }
  input {
    padding: var(--padding);
    border-left: 1px solid var(--border);
  }
</style>