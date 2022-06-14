<script>
  import { fileToBase64 } from "$lib/others/utils";
  import { onMount } from "svelte";
  import Button from "./Button.svelte";
  import ButtonGroup from "./ButtonGroup.svelte";
  
  export let name = 'Choose Image'
  export let image = null
  let fileInput

  const checkImage = url => {
    let img = new Image();
    img.onerror = () => image = null
    img.src = url;
  }

  onMount(() => {
    checkImage(image)
  })

  const removeImage = () => {
    fileInput.value = ''
    image = null
  }

  const previewImage = async e => {
    const [ file ] = e.target.files
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
  </div>
  {/if}
</div>

<ButtonGroup class="mb20">
  {#if image}
  <Button on:click={removeImage} icon="deleteBin" name="Remove Image" />
  {:else}
  <Button on:click={()=>fileInput.click()} icon="add" {name} />
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
    border: 1px dashed gray;
  }
</style>