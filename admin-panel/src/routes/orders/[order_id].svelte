<script>
  import { page } from "$app/stores";
import BillSummary from "$lib/components/BillSummary.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Button from "$lib/components/Button.svelte";
import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";

  // dummy data
  let info = {
    contact: '03212503902',
    created: 'Jun 05, 2022 05:23 PM',
    user_id: 12,
    name: 'Yousuf Iqbal',
    city: 'Karachi',
    address: 'C24, Block 14, Gulistan-e-Jauhar',
    promo: 'None',
    payment_method: 'COD',
  }

  const crumbs = [
    { name: 'Orders', href: '/orders' },
    { name: `Order # ${$page.params.order_id}`, href: '/orders/' + $page.params.order_id },
  ]
</script>

<Breadcrumb {crumbs} />
<Title title="Order # {$page.params.order_id}" />

<Subtitle subtitle="Statuses" />
<Subtitle subtitle="Info" />

<Table>
  <tr>
    <th>Placed On</th>
    <td>{info.created}</td>
  </tr>
  <tr>
    <th>Contact</th>
    <td>{info.contact}</td>
  </tr>
  <tr>
    <th>User ID</th>
    <td>{info.user_id}</td>
  </tr>
  <tr>
    <th>Name</th>
    <td>{info.name}</td>
  </tr>
  <tr>
    <th>City</th>
    <td>{info.city}</td>
  </tr>
  <tr>
    <th>Address</th>
    <td>{info.address}</td>
  </tr>
  <tr>
    <th>Promo</th>
    <td>{info.promo}</td>
  </tr>
  <tr>
    <th>Payment Method</th>
    <td>{info.payment_method}</td>
  </tr>
</Table>

<Subtitle subtitle="Items" />
<Subtitle subtitle="Bill Summary" />

<BillSummary />

<Subtitle subtitle="Actions" />

<Text>
  User has no history of returning or cancelling orders
</Text>

<ButtonGroup>
  <Button icon="check" name="Confirm Order" type="primary" />
</ButtonGroup>

<Subtitle subtitle="Sensitive Area" />

<ButtonGroup>
  <Button icon="close" name="Cancel Order" type="danger" />
</ButtonGroup>