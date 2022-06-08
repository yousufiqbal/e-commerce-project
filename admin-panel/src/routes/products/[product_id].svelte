<script>
  import { page } from "$app/stores";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Product # {$page.params.product_id}" />
<ButtonGroup>
  <Button name="Add Stock" icon="add" />
</ButtonGroup>