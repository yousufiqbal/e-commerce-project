<script>
  import { beforeNavigate } from "$app/navigation";
  import { page } from "$app/stores";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Links from "$lib/components/Links.svelte";
  import Modal from "$lib/components/Modal.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";
import { startCase } from "lodash-es";

  beforeNavigate(() => {
    modal.sort = false
  })

  export let categories = []
  let modal = { sort: false }

  $: sort = $page.url.searchParams.get('sort') || 'alphabetically'
</script>

<Title icon="folders" title="Categories" />

<ButtonGroup>
  <Button icon="add"  name="New Parent" href="{$page.url.pathname}/add-parent" />
  <Button icon="sortDesc" name="Sort: {startCase(sort)}" on:click={()=>modal.sort=true} />
</ButtonGroup>

<Text>
  If your website is in production and your URLs use actual category names instead of IDs, then it is mandatory that you do not change or shift any parent or child category which contains children or products. If you do it, you may lose your SEO juice. 
</Text>


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
        {@html children.path}
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

{#if modal.sort}
<Modal on:close={()=>modal.sort=false}>
  <Subtitle icon="sortDesc" subtitle="Choose Sort" />
  <Links>
    <a href="?sort=alphabetically">Alphabetically</a>
    <a href="?sort=date-ascending">Date Ascending</a>
    <a href="?sort=date-descending">Date Descending</a>
  </Links>
</Modal>
{/if}