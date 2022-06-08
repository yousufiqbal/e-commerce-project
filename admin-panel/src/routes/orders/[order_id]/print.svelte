<script>
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Items from "$lib/components/ItemsPrint.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  let info = {
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
  <Title title="Order # 0001" />
  <Subtitle icon="userThree" subtitle="Customer" />
      
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
  </Table>
  
  <Subtitle icon="listCheckTwo" subtitle="Items" />
  <Items {items} />
  <Subtitle icon="bill" subtitle="Bill Summary" />
  <BillSummary {items} />
</div>

<style>
  .print {
    max-width: 420px;
    margin: 0 auto;
  }
</style>