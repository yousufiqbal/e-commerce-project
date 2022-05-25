<script>
  import Label from "./Label.svelte";

  export let label, name
  export let error, touched = false
</script>

<div class="textarea">

  <Label {label} {name} />
  <textarea name="" id="" cols="30" rows="4"></textarea>

  {#if touched && error}
  <div class="error">Required</div>
  {/if}

</div>

<style>
  textarea {
    padding: 15px;
  }
  .textarea {
    /* border: 1px solid red; */
    display: grid;
    gap: 10px;
    margin-bottom: 20px;;
  }
  .error {
    color: red;
  }
</style>