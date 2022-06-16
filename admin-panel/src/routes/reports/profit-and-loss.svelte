<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Calendar from "$lib/components/Calendar.svelte";
import Checkboxes from "$lib/components/Checkboxes.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Reports', href: '/reports' },
    { name: 'Profit & Loss', href: '/reports/profit-and-loss' },
  ]
</script>
  
<Breadcrumb {crumbs} />
<Title title="Profit & Loss" />
<Calendar />

<Subtitle subtitle="Visual" icon="lineChart" />
<Checkboxes />

<Subtitle subtitle="Tabular" icon="table" />

<Table>
  <tr>
    <th>-</th>
    <th colspan="3">Profit Assessments</th>
    <th colspan="3">Actual Profit</th>
  </tr>
  <tr>
    <th>Dated</th>
    <th>Ordered</th>
    <th>Confirmed</th>
    <th>Dispatched</th>
    <th>Received</th>
    <th>Net Delivery</th>
    <th>Net Profit</th>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr>
    <td>June 21, 2022</td>
    <td>5020</td>
    <td>4010</td>
    <td>4010</td>
    <td>3500</td>
    <td>1100</td>
    <td>2400</td>
  </tr>
  <tr class="strong">
    <td>Total</td>
    <td>15020</td>
    <td>14010</td>
    <td>14010</td>
    <td>13500</td>
    <td>11100</td>
    <td>22400</td>
  </tr>
</Table>