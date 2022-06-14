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

  export let product = { name: '', url_name: '' }
  let image = `/products/${product.url_name}.jpg`

  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: `${startCase($page.params.mode)} Product Image`, href: `/products/${$page.params.mode}-product-image` },
  ]

  const uploadImage = async () => {
    try {
      const response = await axios.post('/api/products/images?product_id=' + $page.url.searchParams.get('product_id'), { image })
      addToast({ message: response.data.message })
      goto('/products')
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot Upload Image', type: 'error' })
    }
  }
  
  const deleteImage = async () => {
    try {
      const response = await axios.delete('/api/products/images?product_id=' + $page.url.searchParams.get('product_id'))
      addToast({ message: response.data.message, type: 'info' })
      goto('/products')
    } catch (error) {
      addToast({ message: error.data.message || 'Cannot Remove Image', type: 'error' })
    }
  }

  const submit = async () => {
    if (image) await uploadImage()
    if (!image) await deleteImage()
  }
</script>

<Breadcrumb {crumbs} />
<Title back title="{product.name}" />

<!-- Uploader -->
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
  <Button on:click={submit} icon="save" type="primary" name="Save Changes" />
  <Button icon="close" name="Discard" />
</ButtonGroup>