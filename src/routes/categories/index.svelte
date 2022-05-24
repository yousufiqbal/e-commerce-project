<script>
  import Categories from "$lib/components/Categories.svelte";
  import Seo from "$lib/components/Seo.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";

  const categories = [
    { name: 'Meat & Fruits', url_name: 'meat-and-fruits' },
    { name: 'Bakery', url_name: 'bakery' },
    { name: 'Beverages', url_name: 'beverages' },
    { name: 'Oil & Ghee', url_name: 'oil-and-ghee' },
    { name: 'Dairy', url_name: 'dairy' },
    { name: 'Snacks & Chips', url_name: 'snacks-and-chips' },
  ]
</script>

<Seo title="Categories" />

<Subtitle subtitle="Grocery" />

<Categories {categories} />

<Subtitle subtitle="Electronics" />

<Categories {categories} />