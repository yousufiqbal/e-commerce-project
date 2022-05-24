<script>
  import Categories from "$lib/components/Categories.svelte";
import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  const categories = [
    { name: 'Meat & Fruits', url_name: 'meat-and-fruits' },
    { name: 'Bakery', url_name: 'bakery' },
    { name: 'Beverages', url_name: 'beverages' },
    { name: 'Oil & Ghee', url_name: 'oil-and-ghee' },
    { name: 'Dairy', url_name: 'dairy' },
    { name: 'Ice Cream & Desserts', url_name: 'ice-cream-and-desserts' },
    { name: 'Snacks & Chips', url_name: 'snacks-and-chips' },
  ]
</script>

<Title title="Categories" />

<Subtitle subtitle="Grocery" />

<Categories {categories} />