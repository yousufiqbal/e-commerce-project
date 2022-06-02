<script>
import { dev } from "$app/env";

import { invalidate } from "$app/navigation";

  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Icon from "$lib/components/Icon.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";
import { axios } from "$lib/others/utils";
import { onMount } from "svelte";

  onMount(() => {
    setTimeout(async () => {
      await markRead()
    }, 2000);
  })

  
  const markRead = async () => {
    try {
      await axios.put('/api/read?type=messages')
      await invalidate('/api/unread')
    } catch (error) {
      if (dev) console.log(error)
    }
  }

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Wallet', href: '/account/wallet' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Wallet" />

<div class="total">
  Rs. 5000
</div>

<Table>
  <tr>
    <td><Icon size="1.1rem" icon="arrowUp" fill="green" /></td>
    <td style="font-weight: bold">Rs. 1000</td>
    <td style="text-align: right">12 Apr, 2022 - 05:23 PM</td>
  </tr>
  <tr>
    <td><Icon size="1.1rem" icon="arrowDown" fill="red" /></td>
    <td style="font-weight: bold">Rs. 1000</td>
    <td style="text-align: right">12 Apr, 2022 - 05:23 PM</td>
  </tr>
  <tr>
    <td><Icon size="1.1rem" icon="arrowUp" fill="green" /></td>
    <td style="font-weight: bold">Rs. 1000</td>
    <td style="text-align: right">12 Apr, 2022 - 05:23 PM</td>
  </tr>
  <tr>
    <td><Icon size="1.1rem" icon="arrowUp" fill="green" /></td>
    <td style="font-weight: bold">Rs. 1000</td>
    <td style="text-align: right">12 Apr, 2022 - 05:23 PM</td>
  </tr>
</Table>

<style>
  .total {
    font-size: 3rem;
    color: green;
    font-family: var(--serif);
    margin-bottom: 30px;
  }
</style>