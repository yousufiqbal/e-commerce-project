<script>
  import { dev } from "$app/env";
  import { invalidate } from "$app/navigation";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Icon from "$lib/components/Icon.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";
  import { axios } from "$lib/others/utils";
  import dayjs from "dayjs";
  import { onMount } from "svelte";

  export let wallets = []
  export let total = 0

  onMount(() => {
    setTimeout(async () => {
      await markRead()
    }, 2000);
  })

  const markRead = async () => {
    try {
      await axios.put('/api/read?type=wallets')
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
  Rs. {total}
</div>

{#if wallets.length != 0}
<Table>

  {#each wallets as wallet}
  <tr>
    <td><Icon size="1.1rem" icon="{ wallet.in > 0 ? 'arrowUp' : 'arrowDown'}" fill="{ wallet.in > 0 ? 'green' : 'red'}" /></td>
    <td style="font-weight: bold">Rs. { Number(wallet.in > 0 ? wallet.in : wallet.out).toFixed(1) }</td>
    <td style="text-align: right">{dayjs(wallet.created).format('MMM DD, YYYY - hh:mm a')}</td>
  </tr>
  {/each}

</Table>
{:else}
<Nothing>
  Wallet is empty
</Nothing>
{/if}

<style>
  .total {
    font-size: 3rem;
    color: green;
    font-family: var(--serif);
    margin-bottom: 30px;
  }
</style>