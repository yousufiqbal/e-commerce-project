<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import Carousel from "$lib/components/Carousel.svelte";
  import MultipleImageUpload from "$lib/components/MultipleImageUpload.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte"; 
  import { startCase } from "lodash-es";

  export let product = { name: '' }
  let images = []

  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: `${startCase($page.params.mode)} Product Carousel`, href: `/products/${$page.params.mode}-product-carousel` },
  ]

  const uploadCarousel = async () => {

  }
</script>

<Breadcrumb {crumbs} />
<Title back title="{product.name}" />

<div style="max-width: 700px">
  <Carousel {images} />
  <MultipleImageUpload on:upload={uploadCarousel} bind:images />
</div>

<!-- Instructions -->
<Subtitle subtitle="Carousel Instructions" icon="listOrdered" />
<Text>
  Choose Carousel images for <strong>{product.name}</strong><br>
  <!-- Image size should be 200 x 200 (1x1) Ratio <br> -->
  Product url_name will be used as names for image name with 'carousel' word in-sha-Allah
</Text>

<ButtonGroup>
  <Button icon="uploadCloud" name="Upload Carousel" type="primary" />
  <Button icon="close" name="Discard" />
</ButtonGroup>