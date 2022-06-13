<script>
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import ImageUpload from "$lib/components/ImageUpload.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte"; 
  import { axios } from "$lib/others/utils";
  import { addToast } from "$lib/stores/toast";
  import { startCase } from "lodash-es";
  import { onMount } from 'svelte'

  // Check if image exist
  // If it does set it to image
  export let imageExistance
  console.log(imageExistance)
  export let product = { name: '' }
  let image = imageExistance ? `${product.url_name}.jpg` : null

  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: `${startCase($page.params.mode)} Product Image`, href: `/products/${$page.params.mode}-product-image` },
  ]

  const uploadImage = async () => {
    try {
      const response = await axios.post('/api/products/images?product_id=' + $page.url.searchParams.get('product_id'), { image })
      addToast({ message: response.data.message })
      goto('/products/add-product-carousel?product_id='+$page.url.searchParams.get('product_id'))
    } catch (error) {
      console.log(error)
      addToast({ message: error.data.message || 'Cannot Upload Image', type: 'error' })
    }
  }
</script>

<Breadcrumb {crumbs} />
<Title back title="{product.name}" />
<ImageUpload on:upload={uploadImage} bind:image />

<!-- Instructions -->
<Subtitle subtitle="Image Instructions" icon="listOrdered" />
<Text>
  Choose product image for <strong>{product.name}</strong><br>
  Image size should be 200 x 200 (1x1) Ratio <br>
  Product url_name will be used as image name in-sha-Allah
</Text>

<Subtitle subtitle="Actions" icon="listOrdered" />
<ButtonGroup> 
  <Button on:click={uploadImage} icon="uploadCloud" type="primary" name="Upload Main Image" />
  <Button icon="close" name="Discard" />
</ButtonGroup>