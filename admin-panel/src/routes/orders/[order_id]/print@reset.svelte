<script>
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Items from "$lib/components/ItemsPrint.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";
import { onMount } from "svelte";

  let mounted = false

  onMount(() => {
    mounted = true
  })

  const print = () => {
    if (!mounted) return
    window.print()
  }

  let info = {
    order_id: '0023',
    contact: '03212503902',
    created: 'Jun 05, 2022 05:23 PM',
    name: 'Yousuf Iqbal',
    city: 'Karachi',
    address: 'C24, Block 14, Gulistan-e-Jauhar',
  }

  const items = [
    { product_id: 1, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
    { product_id: 2, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
    { product_id: 3, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
    { product_id: 4, name: 'Nurpur Butter', url_name: 'nurpur-butter', quantity: '3', price: 200 },
  ]
</script>


<div class="print">
  <div class="hide-during-print">
    <ButtonGroup>
      <Button shortcut="ctrl+enter" icon="printer" name="Print Now" on:click={print} type="primary" />
      <Button shortcut="escape" icon="arrowLeft" name="Go Back" href="/orders/1" />
    </ButtonGroup>
  </div>
  <Title title="Bill for Order # 0023" icon="bill" />
  <Subtitle icon="userThree" subtitle="Customer" />
      
  <Table>
    <tr>
      <th>Order No.</th>
      <td>{info.order_id}</td>
    </tr>
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
  </Table>
  
  <Subtitle icon="listCheckTwo" subtitle="Items" />
  <Items {items} />
  <Subtitle icon="bill" subtitle="Bill Summary" />
  <BillSummary {items} />
</div>

<style>
  .print {
    max-width: 440px;
    padding: 20px;
    border: 1px dashed gray;
    /* border-radius: 10px; */
    /* box-shadow: var(--shadow); */
    margin: 0 auto;
  }
  @media print {
    * {
      color: black !important;
      border-color: black !important;
    }
    .print {
      margin: 0;
      border: none;
      padding: 0;
    }
    .hide-during-print {
      display: none;
    }
  }
</style>