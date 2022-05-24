<script>
  import Carousel from "$lib/components/Carousel.svelte";
  import Link from "$lib/components/Link.svelte";
  import Products from "$lib/components/Products.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Home" />

<Carousel />

<Subtitle subtitle="New Cellphones">
  <Link name="View All" href="/categories/cellphones?sort=newest" />
</Subtitle>

<Products />

<Subtitle subtitle="New Cellphones">
  <Link name="View All" href="/categories/cellphones?sort=newest" />
</Subtitle>

<Products />

<Subtitle subtitle="New Cellphones">
  <Link name="View All" href="/categories/cellphones?sort=newest" />
</Subtitle>

<Products />

<Subtitle subtitle="New Cellphones">
  <Link name="View All" href="/categories/cellphones?sort=newest" />
</Subtitle>

<Products />
