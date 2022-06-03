<script>
  import { invalidate } from "$app/navigation";
  import { addToast } from "$lib/others/toast";
  import { axios } from "$lib/others/utils";

  export let promo = { code: '' }
  export let touched = false, error = ''

  const removePromo = async () => {
    try {
      await axios.delete('/api/promos')
      await invalidate('')
      addToast({ type: 'info', message: 'Promo removed' })
    } catch (error) {
      addToast({ type: 'error', message: 'Cannot remove promo' })
    }
  }
  
  const applyPromo = async () => {
    try {
      await axios.post('/api/promos', promo)
      await invalidate('')
      addToast({ type: 'info', message: 'Promo applied' })
    } catch (error) {
      addToast({ type: 'error', message: 'Cannot apply promo' })
    }
  }
</script>

<div class="wrapper">

  <div class="promo-field">
    <input disabled={promo.promo_id} bind:value={promo.code} on:blur={()=>touched=true} placeholder="5 Letters Code">
    {#if promo.promo_id}
    <button on:click={removePromo}>Remove</button>
    {:else}
    <button on:click={applyPromo}>Apply</button>
    {/if}
  </div>

  {#if promo.promo_id}
  <div class="detail">OFF: {promo.percentage}% | Max Discount: {promo.max_discount} | Validity: {promo.validity}</div>
  {/if}

  {#if touched && error}
  <div class="error">{error}</div>
  {/if}

</div>

<style>
  .detail {
    padding-top: 7px;
  }
  .error {
    text-transform: capitalize;
    color: red;
    padding-top: 7px;
  }
  .wrapper {
    margin-bottom: 20px;
  }
  .promo-field {
    display: flex;
    border: 1px solid var(--border);
    border-radius: 5px;
    overflow: hidden;
    box-shadow: var(--shadow);
  }
  input {
    flex: 1;
    padding: var(--padding-extra);
  }
  button {
    text-transform: uppercase;
    padding: 12px 20px;
    color: white;
    background-color: var(--secondary);
  }
</style>