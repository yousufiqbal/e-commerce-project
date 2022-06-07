<script>
  import { page } from "$app/stores";
  import { isEmpty, startCase } from 'lodash-es'
  import Title from "$lib/components/Title.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Button from "$lib/components/Button.svelte";
  import Field from "$lib/components/Field.svelte";
  import Form from "$lib/components/Form.svelte";
  import { extractYupErrors } from "$lib/database/schema";
  import Table from "$lib/components/Table.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";

  let product = { previousStock: 250, previousCost: 400 }, touched = false, errors = {}
  let margin = 25

  const mode = $page.params.mode
  const crumbs = [
    { name: 'Products', href: '/products', icon: 'listCheck' },
    { name: 'Add Stock', href: '/products/add-stock' },
  ]

  const validate = async () => {
    try {
      await stockSchema.validate(stock, { abortEarly: false })
      error = {}
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (isEmpty(errors)) {
      if (mode == 'add') await addStock()
      if (mode == 'edit') await editStock()
    } else {
      touched = true
    }
  }

  $: postStockValue = ((+product.previousStock * +product.previousCost) + (+product.stock * +product.unit_cost)) / (+product.previousStock + +product.stock)
  $: recommendedPrice = ((+postStockValue * (margin / 100)) + +postStockValue)
</script>

<Breadcrumb {crumbs} />

<Title back="/products" title="{startCase(mode)} Stock" />

<Form>
  <Field bind:value={product.product_id} label="Product" {touched} error={errors['product_id']} />
  <Field bind:value={product.stock} label="Stock" {touched} error={errors['stock']} />
  <Field bind:value={product.unit_cost} label="Unit Cost" {touched} error={errors['unit_cost']} />
  <Field bind:value={product.price} label="Price" {touched} error={errors['price']} />
</Form>

<Subtitle icon="lineChart" subtitle="Metrics" />

<Table>
  <tr>
    <th class="main">Name</th>
    <th>Value</th>
  </tr>
  <tr>
    <td>Previous Stock Quanity</td>
    <td>{product.previousStock}</td>
  </tr>
  <tr>
    <td>Previous Stock Value / Unit</td>
    <td>Rs. {product.previousCost}</td>
  </tr>
  {#if recommendedPrice}
  <tr>
    <td>Recommended price ({margin}% Margin)</td>
    <td>Rs. {recommendedPrice.toFixed(2)}</td>
  </tr>
  {/if}
  {#if postStockValue}
  <tr>
    <td>Post addition stock value / uni</td>
    <td>Rs. {postStockValue.toFixed(2)}</td>
  </tr>
  {/if}
</Table>

<!-- <Text>
  <div> = </div>
  <div> = Rs. </div>
  <div>-------------</div>
  {#if recommendedPrice}
  <div> = Rs.  </div>
  {/if}
  {#if postStockValue}
  <div>t = Rs. </div>
  {/if}
</Text> -->

<ButtonGroup>
  <Button on:click={submit} icon="save" name="Add Stock" type="primary" />
  <Button href="/products" icon="close" name="Discard" />
</ButtonGroup>