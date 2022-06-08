<script>
  import { page } from "$app/stores";
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Items from "$lib/components/Items.svelte";
import Layout from "$lib/components/Layout.svelte";
import Modal from "$lib/components/Modal.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";

  let modalConfirm = false, modalCancel = false

  const items = [
    { product_id: 1, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
    { product_id: 2, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
    { product_id: 3, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
    { product_id: 4, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
  ]

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

  const close = () => {
    modalConfirm = false
    modalCalcel = false
  }
  
  const confirmOrder = () => {

  }
</script>

<Breadcrumb {crumbs} />
<Title title="Order # {$page.params.order_id}" />

<Layout>
  <div slot="main">

    <Subtitle subtitle="Customer Information" />
    
    <Table>
      <tr>
        <!-- TODO href="/users/1" -->
        <th>Name</th>
        <th>Contact</th>
        <th>City</th>
        <th>Address</th>
        <th>Payment</th>
      </tr>
      <tr>
        <td>{info.name}</td>
        <td>{info.contact}</td>
        <td>{info.city}</td>
        <td>{info.address}</td>
        <td>{info.payment_method}</td>
      </tr>
    </Table>
    <Subtitle subtitle="Customer History" />
    <Table>
      <tr>
        <th>Ordered</th>
        <th>Cancelled</th>
        <th>Returned</th>
        <th>Others</th>
      </tr>
      <tr>
        <td>20</td>
        <td>5</td>
        <td>0</td>
        <td>15</td>
      </tr>
    </Table>
    
    <Subtitle subtitle="Order Statuses" />
    <Table>
      <tr>
        <th>Ordered</th>
        <th>Confirmed</th>
        <th>Dispatched</th>
        <th>Received</th>
        <th>Cancelled</th>
        <th>Returned</th>
      </tr>
      <tr>
        <td>June 01, 2022 09:23 PM</td>
        <td>Pending..</td>
        <td>Pending..</td>
        <td>Pending..</td>
        <td>Pending..</td>
        <td>Pending..</td>
      </tr>
    </Table>
    
    
    <Subtitle subtitle="Items" />
    <Items {items} />
  </div>
  <div slot="related">

    <Subtitle subtitle="Promo" />
    <Text>
      No Promo Used
    </Text>
    
    
    <Subtitle subtitle="Bill Summary" />
    
    <BillSummary {items} />
    
    <Subtitle subtitle="Actions" />
    
    <ButtonGroup>
      <Button on:click={()=>modalConfirm=true} icon="check" name="Confirm Order" type="primary" />
      <Button icon="close" name="Cancel Order" type="danger" />
    </ButtonGroup>
  </div>
</Layout>


{#if modalConfirm || modalCancel}
<Modal on:close={close}>

  {#if modalConfirm}
  <Subtitle subtitle="Confirm" />

  <Text>
    Do you want to confirm order no. {$page.params.order_id} of {info.name}?
  </Text>

  <ButtonGroup>
    <Button icon="check" type="primary" name="Yes" on:click={confirmOrder}  />
    <Button icon="close" name="No" on:click={close}  />
  </ButtonGroup>
  {/if}



</Modal>
{/if}