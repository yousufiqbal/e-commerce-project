<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Products" />

<ButtonGroup>
  <Button icon="add" name="New" href="/products/add-product" />
  <Button icon="add" name="Add Stock" />
</ButtonGroup>