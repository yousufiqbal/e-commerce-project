<script>
  import Categories from "$lib/components/Categories.svelte";
  import Title from "$lib/components/Title.svelte";

  export let categories = []
</script>

<Title title="Categories" />

<Categories {categories} />