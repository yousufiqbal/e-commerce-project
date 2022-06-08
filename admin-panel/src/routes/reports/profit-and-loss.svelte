<script>
import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Calendar from "$lib/components/Calendar.svelte";

  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Reports', href: '/reports' },
    { name: 'Profit & Loss', href: '/reports/profit-and-loss' },
  ]
</script>
  
<Breadcrumb {crumbs} />
<Title title="Profit & Loss" />
<Calendar />

<Subtitle subtitle="Tabular" icon="table" />
<Subtitle subtitle="Visual" icon="lineChart" />