<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Pagination from "$lib/components/Pagination.svelte";
  import QueryTabs from "$lib/components/QueryTabs.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  const types = [
    { name: 'Ordered', url_name: 'ordered' },
    { name: 'Confirmed', url_name: 'confirmed' },
    { name: 'Dispatched', url_name: 'dispatched' },
    { name: 'Received', url_name: 'received' },
  ]

  // Fake data
  let orders = [
    { order_id: 1, customer_name: 'Yousuf Iqbal', city: 'Karachi', contact: '03212503902', amount: '950' },
    { order_id: 2, customer_name: 'Yousuf Iqbal', city: 'Karachi', contact: '03212503902', amount: '950' },
    { order_id: 3, customer_name: 'Yousuf Iqbal', city: 'Karachi', contact: '03212503902', amount: '950' },
    { order_id: 4, customer_name: 'Yousuf Iqbal', city: 'Karachi', contact: '03212503902', amount: '950' },
    { order_id: 5, customer_name: 'Yousuf Iqbal', city: 'Karachi', contact: '03212503902', amount: '950' },
  ]
</script>



<Title title="Orders" />

<ButtonGroup>
  <Button icon="add" name="New" type="primary" />
  <Button icon="searchTwo" name="Search" href="/orders/search" />
</ButtonGroup>

<QueryTabs items={types} />

{#if orders.length != 0}
<Table>
  <tr>
    <th>Sr.</th>
    <th>ID</th>
    <th class="main">Name</th>
    <th>City</th>
    <th>Contact</th>
    <th>Amount</th>
  </tr>
  {#each orders as order, index (order.order_id)}
  <tr>
    <td>{index + 1}</td>
    <td>{order.order_id}</td>
    <td><a href="/orders/{order.order_id}">{order.customer_name}</a></td>
    <td>{order.city}</td>
    <td>{order.contact}</td>
    <td>Rs. {order.amount}</td>
  </tr>
  {/each}
</Table>

{:else}
<Nothing>
  No Orders
</Nothing>
{/if}

<Pagination />