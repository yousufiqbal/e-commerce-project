<script>
  import { kebabCase } from "lodash-es";

  export let label, name = kebabCase(label)
  export let inputmode = ''
  export let el = null
  export let type = 'text' 
  export let touched = false, error = ''
  export let value = undefined
  export let placeholder = null
  export let disabled = false
  export let textarea = false

  const typeMe = node => {
    node.type = type
  }
</script>

<div class="field">
  <div class="label-input">
    <label for="{name}">{label}</label>
    {#if !textarea}
    <input on:focus {inputmode} {disabled} bind:value size="1" {placeholder} bind:this={el} spellcheck="false" autocomplete="off" id="{name}" {name} use:typeMe on:blur={()=>touched=true} >
    {:else}
    <textarea {inputmode} {disabled} bind:value size="1" {placeholder} bind:this={el} spellcheck="false" autocomplete="off" id="{name}" {name} on:blur={()=>touched=true} cols="10" rows="2"></textarea>
    {/if}
  </div>
  {#if touched && error}
  <div class="error">{error}</div>
  {/if}
</div>

<style>
  .field:focus-within label {
    color: rgb(229, 0, 0);
  }
  .field {
    display: grid;
  }
  .field:last-child {
    border-bottom: 1px solid var(--border);
  }
  .error {
    text-transform: capitalize;
    color: red;
    padding: var(--padding);
    border-top: 1px solid var(--border);
    border-left: 1px solid var(--border);
    border-right: 1px solid var(--border);
  }
  .label-input {
    display: grid;
    grid-template-columns: 130px 1fr;
    border: 1px solid var(--border);
    border-bottom: none;
  }
  label {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    background-color: rgb(248, 248, 248);
    padding: var(--padding);
    /* border: 1px solid green; */
  }
  input, textarea {
    padding: var(--padding);
    border-left: 1px solid var(--border);
  }
</style>