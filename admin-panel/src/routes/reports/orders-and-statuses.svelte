<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Calendar from "$lib/components/Calendar.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";
  
  const crumbs = [
    { name: 'Reports', href: '/reports' },
    { name: 'Orders & Statuses', href: '/reports/orders-and-statuses' },
  ]
</script>
  
<Breadcrumb {crumbs} />
<Title title="Orders & Statuses" />
<Calendar />

<Subtitle icon="lineChart" subtitle="Visual" />

<Subtitle icon="table" subtitle="Tabular" />
<Table>
  <tr>
    <th>Sr.</th>
    <th class="main">Dated</th>
    <th>Ordered</th>
    <th>Confirmed</th>
    <th>Dispatched</th>
    <th>Received</th>
    <th>Returned</th>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>20</td>
    <td>40</td>
    <td>40</td>
    <td>30</td>
    <td>5</td>
  </tr>
  <tr class="strong">
    <td colspan="2">Total</td>
    <td>200</td>
    <td>400</td>
    <td>400</td>
    <td>300</td>
    <td>50</td>
  </tr>
</Table>