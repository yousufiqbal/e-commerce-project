<script>
  import { goto, invalidate } from "$app/navigation";
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
  import { axios, beautifyDateTime } from "$lib/others/utils";
  import { addToast } from "$lib/stores/toast";
  import { startCase } from "lodash-es";

  export let order = {}
  export let order_details = []
  export let statuses = []
  $: last_status = statuses[0].status
  let modal = { confirm: false, cancel: false }
  let certain = ''

  const crumbs = [
    { name: 'Orders', href: '/orders', icon: 'listOrdered' },
    { name: `Order # ${$page.params.order_id}`, href: '/orders/' + $page.params.order_id },
  ]

  const nextOf = {
    'ordered': 'confirm',
    'confirmed': 'dispatch',
    'dispatched': 'receive',
    'received': 'return',
  }

  const close = () => {
    modal.confirm = false
    modal.cancel = false
  }
  
  const proceedOrder = async () => {
    try {
      modal.confirm = false
      const response = await axios.post('/api/order-statuses?order_id='+$page.params.order_id, { status: nextOf[last_status] })
      addToast({ message: response.data.message })
      await invalidate($page.url.pathname)
      // TODO if confirming order.. print bill.
    } catch (error) {
      addToast({ message: error.data.message || `Cannot ${nextOf[last_status]} order`, type: 'error' })
    }
  }

  const cancelOrder = async () => {

  }
</script>

<Breadcrumb {crumbs} />
<Title title="Order # {$page.params.order_id}"  />

<ButtonGroup>
  <Button on:click={()=>modal.confirm=true} icon="check" name="{startCase(nextOf[last_status])} Order" type="{last_status == 'received' ? 'danger' : 'primary'}" />
  <Button icon="deleteBin" name="Cancel Order" on:click={()=>modal.cancel=true} />
</ButtonGroup>

<Divider />

<Layout columns="repeat(3, 1fr)">

  <div class="left">
    <Subtitle icon="listCheck" subtitle="Items" />
    <Items items={order_details} />
  </div>

  <div class="middle">
    <Subtitle subtitle="Order Statuses" />
    <Table>
      {#each statuses as status}
      <tr>
        <th>{startCase(status.status)}</th>
        <td>{beautifyDateTime(status.created)}</td>
      </tr>
      {/each}
    </Table>
    <ButtonGroup>
      <Button icon="arrowGoBack" name="Revoke Last Status" />
    </ButtonGroup>
    <Subtitle icon="userThree" subtitle="Customer Information" />
    <Table>
      <tr>
        <th>Name</th>
        <td class="main">{order.name}</td>
      </tr>
      <tr>
        <th>Contact</th>
        <td>{order.contact}</td>
      </tr>
      <tr>
        <th>City</th>
        <td>{order.city}</td>
      </tr>
      <tr>
        <th>Address</th>
        <td>{order.address}</td>
      </tr>
      <tr>
        <th>Payment</th>
        <td>{order.payment_method}</td>
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
    <BillSummary items={order_details} />
  </div>

</Layout>


{#if modal.confirm || modal.cancel}
<Modal on:close={close}>

  {#if modal.confirm}
  <Subtitle icon="errorWarning" subtitle="Confirm {startCase(nextOf[last_status])}" />

  <Text>
    Do you want to {nextOf[last_status]} Order # {$page.params.order_id} of {order.name}?
  </Text>

  <Spaced>
    <Button icon="check" type="primary"  name="Yes ({startCase(nextOf[last_status])})" on:click={proceedOrder}  />
    <Button icon="close" name="No" on:click={close}  />
  </Spaced>
  {/if}
  
  {#if modal.cancel}
  <Subtitle icon="errorWarning" subtitle="Confirm Cancellation" />
  
  <Text>
    Do you want to CANCEL order no. {$page.params.order_id} of {order.name}?
  </Text>

  <Certain bind:certain placeholder="Type 'cancel' here" />

  {#if certain.toLowerCase() == 'cancel'}
  <Spaced>
    <Button icon="check" type="primary" name="Yes" on:click={cancelOrder}  />
    <Button icon="close" name="No" on:click={close}  />
  </Spaced>
  {/if}

  {/if}

</Modal>
{/if}

