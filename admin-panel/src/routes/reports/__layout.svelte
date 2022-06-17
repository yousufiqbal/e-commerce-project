<script>
  import Layout from "$lib/components/Layout.svelte";
  import StandaloneMenu from "$lib/components/StandaloneMenu.svelte";
  import Title from "$lib/components/Title.svelte";

  const reports = [
    { name: 'Profit & Loss', href: '/reports/profit-and-loss' },
    { name: 'Orders & Statuses', href: '/reports/orders-and-statuses' },
    { name: 'User Registartions', href: '/reports/user-registrations' },
    { name: 'Product Views', href: '/reports/product-views' },
    { name: 'Page Views', href: '/reports/page-views' },
    { name: 'Category Wise Sales', href: '/reports/category-wise-sales' },
  ]
</script>

<Title title="Reports" icon="lineChart" />

<Layout columns="1.52fr 5fr">
  <div>
    <StandaloneMenu type="link" items={reports} />
  </div>
  <div>
    <slot></slot>
  </div>
</Layout>