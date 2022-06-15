<script>
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Certain from "$lib/components/Certain.svelte";
import Divider from "$lib/components/Divider.svelte";
  import Items from "$lib/components/Items.svelte";
  import Layout from "$lib/components/Layout.svelte";
  import Modal from "$lib/components/Modal.svelte";
  import Spaced from "$lib/components/Spaced.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";

  let modal = { confirm: false, cancel: false }
  let certain = ''

  const items = [
    { product_id: 1, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
    { product_id: 2, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
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
    modal.confirm = false
    modal.cancel = false
  }
  
  const confirmOrder = () => {
    goto('/orders/1/print')
  }
</script>

<Breadcrumb {crumbs} />
<Title title="Order # {$page.params.order_id}" />
<ButtonGroup>
  <Button on:click={()=>modal.confirm=true} icon="check" name="Confirm Order" type="primary" />
  <Button icon="deleteBin" name="Cancel Order" on:click={()=>modal.cancel=true} />
</ButtonGroup>

<Divider />

<Layout columns="repeat(3, 1fr)">

  <div class="left">
    <Subtitle icon="listCheck" subtitle="Items" />
    <Items {items} />
    <Subtitle subtitle="Order Statuses" />
    <Table>
      <tr>
        <th>Ordered</th>
        <td>June 01, 2022 09:23 PM</td>
      </tr>
      <tr>
        <th>Confirmed</th>
        <td>Pending..</td>
      </tr>
      <tr>
        <th>Dispatched</th>
        <td>Pending..</td>
      </tr>
      <tr>
        <th>Received</th>
        <td>Pending..</td>
      </tr>
      <tr>
        <th>Cancelled</th>
        <td>Pending..</td>
      </tr>
      <tr>
        <th>Returned</th>
        <td>Pending..</td>
      </tr>
    </Table>
  </div>

  <div class="middle">

    <Subtitle icon="userThree" subtitle="Customer Information" />
    <Table>
      <tr>
        <th>Name</th>
        <td class="main">{info.name}</td>
      </tr>
      <tr>
        <th>Contact</th>
        <td>{info.contact}</td>
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
        <th>Payment</th>
        <td>{info.payment_method}</td>
      </tr>
    </Table>
    
    <Subtitle icon="history" subtitle="Customer History" />
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

  </div>

  <div class="right">
    <Subtitle icon="coupon" subtitle="Promo" />
    <Text>
      No Promo Used
    </Text>
    <Subtitle icon="bill" subtitle="Bill Summary" />
    <BillSummary {items} />
  </div>

</Layout>


{#if modal.confirm || modal.cancel}
<Modal on:close={close}>

  {#if modal.confirm}
  <Subtitle icon="errorWarning" subtitle="Confirm" />

  <Text>
    Do you want to confirm order no. {$page.params.order_id} of {info.name}?
  </Text>

  <Spaced>
    <Button icon="check" type="primary"  name="Yes (Confirm)" on:click={confirmOrder}  />
    <Button icon="close" name="No" on:click={close}  />
  </Spaced>
  {/if}
  
  {#if modal.cancel}
  <Subtitle icon="errorWarning" subtitle="Confirm Cancellation" />
  
  <Text>
    Do you want to CANCEL order no. {$page.params.order_id} of {info.name}?
  </Text>

  <Certain bind:certain placeholder="Type 'cancel' here" />

  {#if certain.toLowerCase() == 'cancel'}
  <Spaced>
    <Button icon="check" type="primary" name="Yes" on:click={confirmOrder}  />
    <Button icon="close" name="No" on:click={close}  />
  </Spaced>
  {/if}

  {/if}

</Modal>
{/if}

