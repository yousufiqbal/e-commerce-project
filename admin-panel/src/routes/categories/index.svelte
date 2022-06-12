<script>
  import { page } from "$app/stores";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Card from "$lib/components/Card.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";

  export let categories = []
</script>

<Title icon="folders" title="Categories" />

<ButtonGroup>
  <Button icon="add"  name="New Parent" href="{$page.url.pathname}/add-parent" />
</ButtonGroup>

<Text>
  If your website is in production, then it is mandatory that you do not change or shift any parent or child category which contains children or products. If you do it, you may lose your SEO juice. 
</Text>

<div class="mb40"></div>

{#each categories as category}
<Subtitle icon="listOrdered" subtitle={category.name} />

<ButtonGroup>
  <Button icon="add"  name="New Child" href="{$page.url.pathname}/add-child?parent_id={category.parent_id}" />
  <Button icon="editBox" name="Edit Parent" href="{$page.url.pathname}/edit-parent?category_id={category.parent_id}" />
</ButtonGroup>

{#if category.children.length != 0}
<Table>
  {#each category.children as children, index}
  <tr>
    <td>{index+1}.</td>
    <td class="main">
      <div class="level">
        {@html children.path}
      </div>
    </td>
    <td>15 Products</td>
    <td><a href="{$page.url.pathname}/add-child?parent_id={children.category_id}">Append</a></td>
    <td><a href="{$page.url.pathname}/edit-child?parent_id={children.parent_id}&child_id={children.category_id}">Edit</a></td>
  </tr>
  {/each}
</Table>
{:else}
<Nothing>
  No Children
</Nothing>
{/if}
{/each}


<div class="levels">
</div>


<style>
  .level {
    display: flex;
    gap: 10px;
  }
</style>