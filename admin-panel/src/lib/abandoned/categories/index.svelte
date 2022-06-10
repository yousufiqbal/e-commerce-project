<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  const Categories = [
    {
    name: 'Electronics',
    subcategories: [
      {
        category_id: 31,
        name: 'Cellphones',
        url_name: 'cellphones',
        parent_id: 21,
        created: new Date()      
      },
    ]
  }
  ]

  /** @type {Categories} */
  export let categories = []
</script>

<Title title="Categories" />

<ButtonGroup>
  <Button icon="add" name="New Category" href="/categories/add-category" />
</ButtonGroup>

{#each categories as category, index}
<Subtitle subtitle={category.name} />

<ButtonGroup>
  <Button icon="editBox" name="Edit" href="/categories/edit-category?category_id={category.category_id}" />
  <Button icon="add" name="New Subcategory" href="/categories/add-subcategory?category_id={category.category_id}" />
</ButtonGroup>

<Table>
  <tr>
    <th>Sr.</th>
    <th>Name</th>
    <th></th>
  </tr>
  {#each category.subcategories as subcategory}
  <tr>
    <td>{index + 1}</td>
    <td class="main">{subcategory.name}</td>
    <td><a href="/categories/edit-subcategory?subcategory_id={subcategory.category_id}">Edit</a></td>
  </tr>
  {/each}
</Table>
{/each}