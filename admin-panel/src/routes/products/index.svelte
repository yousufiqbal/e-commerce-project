<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import Nothing from "$lib/components/Nothing.svelte";
  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Products" />

<ButtonGroup>
  <Button icon="add" name="New" href="/products/add-product" />
  <Button icon="add" name="Add Stock" href="/products/add-stock" />
</ButtonGroup>

<Nothing>
  No Products
</Nothing>