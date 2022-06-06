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

<div class="input">
  <input bind:value size="1" placeholder="{label}" bind:this={el} spellcheck="false" autocomplete="off" id="{name}" {name} use:typeMe on:blur={()=>touched=true} type="text">
  {#if touched && error}
  <div class="error">{error}</div>
  {/if}
</div>

<style>
  .input {
    display: grid;
    gap: 7px;
  }
  input {
    border-radius: 4px;
    border: 1px solid var(--border);
    padding: 10px 15px;
  }
  .error {
    color: rgb(255, 77, 77);
  }
</style>