<script>
  import Button from "./Button.svelte";
  import ButtonGroup from "./ButtonGroup.svelte";
  import { fileToBase64 } from "$lib/others/utils";
import Nothing from "./Nothing.svelte";

  export let image = null
  let fileInput = null
  let filename

  const removeImage = () => {
    fileInput.value = ''
    image = null
  }

  const previewImage = async e => {
    const [ file ] = e.target.files
    filename = file.name
    image = await fileToBase64(file)
  }
</script>

<div class="image-upload">
  {#if image}
  <img src="{image}" alt="">
  {:else}
  <Nothing --margin-bottom="0">
    No Image
  </Nothing>
  {/if}
  <ButtonGroup>
    {#if !image}
    <Button icon="imageAdd" name="Choose Image" on:click={()=>fileInput.click()} />
    {:else}
    <Button icon="deleteBin" name="Remove Image" />
    {/if}
  </ButtonGroup>
</div>

<input on:change={previewImage} hidden bind:this={fileInput} type="file" accept=".jpg">

<style>
  .image-upload {
    display: grid;
    gap: 20px;
  }
  img {
    border-radius: 10px;
    max-width: 400px;
  }
</style>