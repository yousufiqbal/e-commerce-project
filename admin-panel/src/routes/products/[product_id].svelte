<script>
  import { page } from "$app/stores";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Product # {$page.params.product_id}" />
<!-- <Breadcrumb {crumbs} /> -->


<ButtonGroup>
  <Button name="Add Stock" icon="add" />
  <Button name="Edit Product" icon="editBox" />
  <Button name="View Stocks" icon="eye" />
  <Button name="Individual Report" icon="lineChart" />
</ButtonGroup>

<Subtitle subtitle="General Info." icon="homeThree" />