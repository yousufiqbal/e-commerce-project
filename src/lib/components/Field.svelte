<script>
  export let label, name
  export let touched = false, error = null
  export let value = undefined

  export let idColumn, valueColumn

  export let items = []
  
  /** @type {'input'|'radio'|'textarea'|'select'|'selectSimple'}*/
  export let face
</script>

<div class="field">

  <label for="{name}">{label}</label>

  {#if face == 'textarea'}
  <textarea bind:value {name} id="{name}" rows="3"></textarea>
  {/if}

  {#if face == 'radio'}
  <div class="radio">
    {#each items as item}
    <input bind:group={value} type="radio" id={item[idColumn]} name={item[idColumn]} value={item[idColumn]}>
    <label for="{item[idColumn]}">{item[valueColumn]}</label>
    {/each}
  </div>
  {/if}

  {#if face == 'input'}
  <input type="text">
  {/if}

  {#if touched && error}
  <div class="error">
    {error}
  </div>
  {/if}

</div>

<style>
  .radio {
    display: flex;
    align-items: center;
    gap: 10px;
    /* accent-color: rgb(0, 188, 0); */
  }
  .field {
    display: grid;
    gap: 10px;
    /* border: 1px solid red; */
    margin-bottom: 20px; /*temp*/
  }
  .field > label {
    /* color: green; */
    font-size: 1rem;
    font-family: var(--serif);
  }
  .error {
    color: red;
  }
  textarea, input {
    border: 1px solid var(--border);
    border-radius: 5px;
    padding: 10px 15px;
  }
</style>