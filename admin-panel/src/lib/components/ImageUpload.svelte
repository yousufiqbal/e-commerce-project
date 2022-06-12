<script>
  import { fileToBase64 } from "$lib/others/utils";
  import Button from "./Button.svelte";
  import ButtonGroup from "./ButtonGroup.svelte";

  export let name = 'Upload Image'
  export let image = null
  let filename
  let fileInput

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

<input on:change={previewImage} accept=".jpg, .jpeg" hidden bind:this={fileInput} type="file">

<div class="image-upload">
  {#if image}
  <div class="product-image">
    <div class="frame">
      <img src="{image}" alt="">
    </div>
    <div class="filename">{filename}</div>
  </div>
  {/if}
</div>

<ButtonGroup class="mb20">
  {#if image}
  <Button on:click={removeImage} icon="deleteBin" name="Remove Image" />
  {:else}
  <Button on:click={()=>fileInput.click()} icon="imageAdd" {name} />
  <div style="border: 1px solid red; padding: var(--padding); color: red">No image</div>
  {/if}
</ButtonGroup>

<style>
  .product-image {
    /* outline: 1px solid red; */
    display: grid;
    justify-content: start;
    margin-bottom: 20px;
  }
  .frame {
    /* outline: 1px solid red; */
    max-width: 200px;
  }
  .product-image img {
    width: 100%;
    height: auto;
  }
</style>