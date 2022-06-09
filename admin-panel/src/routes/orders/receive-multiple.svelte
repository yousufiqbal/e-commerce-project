<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Modal from "$lib/components/Modal.svelte";
import Spaced from "$lib/components/Spaced.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";

  let modal = false
  let order_ids 
  let wait = false

  // fake data
  let orders = [
    { order_id: 2, name: 'Naseem', city: 'Karachi', address: 'c23, Jauhar', amount: '5200', last_status: 'Dispatched', last_status_date: '01, June, 2022 23:12' },
    { order_id: 3, name: 'Naseem', city: 'Karachi', address: 'c23, Jauhar', amount: '5200', last_status: 'Dispatched', last_status_date: '01, June, 2022 23:12' },
    { order_id: 4, name: 'Naseem', city: 'Karachi', address: 'c23, Jauhar', amount: '5200', last_status: 'Dispatched', last_status_date: '01, June, 2022 23:12' },
    { order_id: 5, name: 'Naseem', city: 'Karachi', address: 'c23, Jauhar', amount: '5200', last_status: 'Dispatched', last_status_date: '01, June, 2022 23:12' },
  ]

  const crumbs = [
    { name: 'Orders', href: '/orders', icon: 'listOrdered' },
    { name: 'Receive Multiple', href: '/orders/receive-multiple' },
  ]

  const receiveMultiple = () => {
    // fake waiting
    modal = false
    wait = 'Receiving..'
    setTimeout(() => {
      wait = false
    }, 2000);
  }

  const resetAll = () => {
    order_ids = []
    orders = []
  }
</script>

<Breadcrumb {crumbs} />
<Title back="/orders" title="Receive Multiple" />
<Subtitle icon="survey" subtitle="Enter Order IDs" />

<textarea placeholder="Separate IDs using spaces. For eg. 0091 0095 0075" bind:value={order_ids} name="" id="" cols="100" rows="5"></textarea>

<ButtonGroup>
  <Button icon="download" name="Fetch Orders" type="primary" />
  <Button icon="refresh" name="Reset All" on:click={resetAll} />
</ButtonGroup>

{#if orders.length != 0}
<Subtitle subtitle="Results" icon="listOrdered" />

<Table>
  <tr>
    <th>Sr.</th>
    <th>Order ID</th>
    <th>Name</th>
    <th>City</th>
    <th>Address</th>
    <th>Amount</th>
    <th>Last Status</th>
    <th>L.S. Date</th>
  </tr>
  {#each orders as order, index (order.order_id)}
  <tr>
    <td>{index+1}</td>
    <td>{order.order_id}</td>
    <td>{order.name}</td>
    <td>{order.city}</td>
    <td>{order.address}</td>
    <td>{order.amount}</td>
    <td class="important">{order.last_status}</td>
    <td>{order.last_status_date}</td>
  </tr>
  {/each}
</Table>

<ButtonGroup>
  <Button icon="handHeart" name={wait || `Receive All (${orders.length}) Orders`} on:click={()=>modal=true}  />
</ButtonGroup>
{/if}

{#if modal}
<Modal on:close={()=>modal=false}>
  <Subtitle icon="errorWarning" subtitle="Confirm Receive" />
  <Text>
    Are you sure you want to receive {orders.length} orders? This action cannot be reversed!
  </Text>
  <Spaced>
    <Button icon="checkDouble" name="Yes RECEIVE" type="primary" on:click={receiveMultiple}  />
    <Button icon="close" name="No" on:click={()=>modal=false}  />
  </Spaced>
</Modal>
{/if}

<style>
  textarea {
    border: 1px solid var(--border);
    border-radius: 5px;
    margin-bottom: 20px;
    padding: var(--padding-extra);
  }
</style>