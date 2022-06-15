<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import Calendar from "$lib/components/Calendar.svelte";
import Divider from "$lib/components/Divider.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Pagination from "$lib/components/Pagination.svelte";
  import Pills from "$lib/components/Pills.svelte";
import Search from "$lib/components/Search.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";
import { beautifyDateTime } from "$lib/others/utils";

  const types = [
    { name: 'Ordered', url_name: 'ordered' },
    { name: 'Confirmed', url_name: 'confirmed' },
    { name: 'Dispatched', url_name: 'dispatched' },
    { name: 'Received', url_name: 'received' },
    { name: 'Cancelled', url_name: 'cancelled' },
    { name: 'Returned', url_name: 'returned' },
  ]

  // Fake data
  export let orders = []
</script>

<Title icon="listOrdered" title="Orders" />

<ButtonGroup>
  <Button icon="add" name="New" type="primary" />
  <Button icon="searchTwo" name="Search Orders"/>
  <!-- <Button icon="truck" name="Dispatch Multiple" href="/orders/dispatch-multiple" /> -->
  <!-- <Button icon="handHeart" name="Receive Multiple" href="/orders/receive-multiple" /> -->
  <!-- <Search placeholder="Search Orders (Ctrl + K)" /> -->
</ButtonGroup>

<ButtonGroup>
  <Pills pills={types} />
</ButtonGroup>

<div class="mb30"></div>
<!-- <Divider /> -->

<!-- <Calendar /> -->

{#if orders.length != 0}
<Table>
  <tr>
    <th>({orders.length})</th>
    <th>ID</th>
    <th class="main">Name</th>
    <th>City</th>
    <th>Address</th>
    <th>Payment</th>
    <th>Items</th>
    <th>Total Amount</th>
    <th>G.P.</th>
    <th>Created</th>
  </tr>
  {#each orders as order, index (order.order_id)}
  <tr>
    <td>{index + 1}</td>
    <td>{order.order_id}</td>
    <td><a href="/orders/{order.order_id}">{order.name}</a></td>
    <td>{order.city}</td>
    <td>{order.address}</td>
    <td>{order.payment_method}</td>
    <td>{order.items}</td>
    <td>{order.total_amount}</td>
    <td>{order.profit}</td>
    <td>{beautifyDateTime(order.created)}</td>
  </tr>
  {/each}
</Table>

{:else}
<Nothing>
  No Orders
</Nothing>
{/if}

<Pagination />