<script>
  import { fileToBase64 } from "$lib/others/utils";
  import Button from "./Button.svelte";
  import ButtonGroup from "./ButtonGroup.svelte";
  import Table from "./Table.svelte";

  let fileInput
  export let name = 'Add Multiple Images'
  export let images = []

  const addImages = async e => {
    const files = e.target.files
    for (const file of files) {
      const image = await fileToBase64(file)
      const filename = file.name
      // TODO some mechanism to remove duplicates.. here..
      images.push({
        filename, image
      })
    }
    images.map
    images = images
    fileInput.value = ''
  }

  const removeImage = index => {
    images.splice(index, 1)
    images = images
  }

  const swap = (action, index) => {
    if (action == 'up') {
      if (index == 0) return
      const tmp = images[index]
      images[index] = images[index - 1]
      images[index - 1] = tmp
    }
    if (action == 'down') {
      if (index == images.length - 1) return
      const tmp = images[index]
      images[index] = images[index + 1]
      images[index + 1] = tmp
    }
  }
</script>

<input multiple hidden type="file" bind:this={fileInput} on:change={addImages} accept=".jpeg, .jpg" name="carousel-upload">

<ButtonGroup>
  <Button on:click={()=>fileInput.click()} icon="imageAdd" {name} />
  {#if images.length == 0}
  <div style="border: 1px solid red; padding: var(--padding); color: red;">No images</div>
  {/if}
</ButtonGroup>

{#if images.length != 0}
<Table>
  <tr>
    <th>Sr.</th>
    <th class="main">Filename</th>
    <th>Image</th>
    <th colspan="3">Actions</th>
  </tr>
  {#each images as image, index}
  <tr>
    <td>{index + 1}</td>
    <td>{image.filename}</td>
    <td><img style="width: 100%" src="{image.image}" alt=""></td>
    <td><button name="{index}" on:click={removeImage}>Remove</button></td>
    <td>
      {#if index != 0}
      <button on:click={()=>swap('up', index)}>Up</button>
      {/if}
    </td>
    <td>
      {#if index != images.length - 1}
      <button on:click={()=>swap('down', index)}>Down</button>
      {/if}
    </td>
  </tr>
  {/each}
</Table>
{/if}

<div style="margin-bottom: 40px;"></div>