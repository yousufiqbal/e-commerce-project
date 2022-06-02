<script>
import dayjs from "dayjs";

import Nothing from "./Nothing.svelte";

  export let promos = []
</script>

{#if promos.length != 0}
<div class="promos">
  
  {#each promos as promo (promo.promo_id)}
  <div class:expired={promo.status == 'expired' || promo.status == 'consumed'} class="promo card">
    
    <div class="title">
      <h2>{promo.code}</h2>
      <div class="status valid">{promo.status}</div>
    </div>
    
    <div>
      <p>{promo.percentage}% Off - Upto Rs. {promo.max_discount}</p>
      <p>Validity {dayjs(promo.validity).format('MMM DD, YYYY - hh:mm a')}</p>
    </div>
    
  </div>
  {/each}
    
</div>
{:else}
<Nothing>
  No Promos
</Nothing>
{/if}

<style>
  .promos {
    display: grid;
    gap: 20px;
    /* border: 1px solid red; */
  }
  .title {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .expired {
    user-select: none;
    background-color: rgb(227, 227, 227);
    opacity: 0.7;
  }
  .promo {
    display: grid;
    gap: 10px;
  }
  h2 {
    font-size: 1.2rem;
    font-family: var(--serif);
  }
  .status {
    text-transform: uppercase;
  }
  .valid {
    font-family: var(--serif);
    color: green;
  }
</style>