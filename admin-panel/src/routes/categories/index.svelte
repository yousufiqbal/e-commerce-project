<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  // Dummy Data
  export let categories = [
    { category_id: 1, name: 'Dairy', subcategories: [
      { subcategory_id: 2, name: 'Eggs', },
      { subcategory_id: 3, name: 'Cream', },
      { subcategory_id: 4, name: 'Milk', },
      { subcategory_id: 5, name: 'Yogurt', },
      { subcategory_id: 6, name: 'Butter', },
    ]},
    { category_id: 2, name: 'Dairy', subcategories: [
      { subcategory_id: 12, name: 'Eggs', },
      { subcategory_id: 13, name: 'Cream', },
      { subcategory_id: 14, name: 'Milk', },
      { subcategory_id: 15, name: 'Yogurt', },
      { subcategory_id: 16, name: 'Butter', },
    ]},
    { category_id: 3, name: 'Dairy', subcategories: [
      { subcategory_id: 22, name: 'Eggs', },
      { subcategory_id: 23, name: 'Cream', },
      { subcategory_id: 24, name: 'Milk', },
      { subcategory_id: 25, name: 'Yogurt', },
      { subcategory_id: 26, name: 'Butter', },
    ]},
    { category_id: 4, name: 'Dairy', subcategories: [
      { subcategory_id: 32, name: 'Eggs', },
      { subcategory_id: 33, name: 'Cream', },
      { subcategory_id: 34, name: 'Milk', },
      { subcategory_id: 35, name: 'Yogurt', },
      { subcategory_id: 36, name: 'Butter', },
    ]},
  ]
</script>

<Title title="Categories" />

<ButtonGroup>
  <Button icon="add" name="New Category" href="/categories/add-category" />
</ButtonGroup>

{#each categories as category, index (category.category_id)}
<Subtitle subtitle="{index+1}. {category.name}" />

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

  {#each categories[index].subcategories  as subcategory, index (subcategory.subcategory_id)}
  <tr>
    <td>{index + 1}</td>
    <td class="main">{category.name}</td>
    <td><a href="/categories/edit-subcategory?subcategory_id={subcategory.subcategory_id}">Edit</a></td>
  </tr>
  {/each}

</Table>
{/each}

