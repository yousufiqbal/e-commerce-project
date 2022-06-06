<script>
  import { kebabCase } from "lodash-es";

  export let label, name = kebabCase(label)
  export let checked = false
</script>

<div class="checkbox">
  <input {name} id={name} type="checkbox" bind:checked>
  <label for="{name}">Name Automatically</label>
</div>

<style>
  .checkbox {
    display: flex;
    align-items: center;
    gap: 5px;
    margin-bottom: 20px;
}
</style>