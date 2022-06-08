<script>
  import { beautifyDateTime } from "$lib/others/utils";
  import Nothing from "./Nothing.svelte";
  import SmallButton from "./SmallButton.svelte";
  import SmallButtonGroup from "./SmallButtonGroup.svelte";

  export let orders = []
</script>

{#if orders.length != 0}
<div class="orders">
  
  {#each orders as order}
  <div class="order card">

    <h2>Order # {order.order_id}</h2>

    <div style="margin-bottom: 10px;">
      <p class="dated">Placed On: {beautifyDateTime(order.created)}</p>
      <p class="dated">Expected On: {order.expected || 'WIP'}</p>
    </div>

    <SmallButtonGroup>
      <SmallButton href="/account/orders/{order.order_id}" icon="eye" name="Show Details" />
    </SmallButtonGroup>
    
  </div>
  {/each}
  
</div>

{:else}
<Nothing>
  No Orders
</Nothing>
{/if}

<style>
  .order {
    display: grid;
    gap: 10px;
  }
  h2 {
    font-size: 1.2rem;
    font-family: var(--serif);
  }
  .orders {
    display: grid;
    gap: 20px;
  }
  @media (min-width: 960px) {
    .orders {
      grid-template-columns: 1fr 1fr;
    }
  }
</style>