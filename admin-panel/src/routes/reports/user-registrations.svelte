<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Calendar from "$lib/components/Calendar.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";
  
  const crumbs = [
    { name: 'Reports', href: '/reports' },
    { name: 'User Registraions', href: '/reports/user-registrations' },
  ]
</script>
  
<Breadcrumb {crumbs} />
<Title title="User Registrations" />
<Calendar />
<Subtitle icon="lineChart" subtitle="Visual" />
<Subtitle icon="table" subtitle="Tabular" />
<Table>
  <tr>
    <th>Sr.</th>
    <th class="main">Dated</th>
    <th>Registrations</th>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr>
    <td>1</td>
    <td>June 01, 2022</td>
    <td>22</td>
  </tr>
  <tr class="strong">
    <td colspan="2">Total</td>
    <td>2222</td>
  </tr>
</Table>