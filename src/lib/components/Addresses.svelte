<script>
  import { createEventDispatcher } from "svelte";
  import Icon from "./Icon.svelte";
  import Nothing from "./Nothing.svelte";
  const dispatch = createEventDispatcher()

  export let addresses = []
</script>

{#if addresses.length != 0}
<div class="addresses">
  
  {#each addresses as address (address.address_id)}
  <div  class="address card">

    <h2>{address.label}</h2>
    <p>{address.address} - {address.city}</p>

    <div class="actions">

      {#if address.default == '1'}
      <div class="default">
        <Icon icon="checkDouble" />
        <span>Default</span>
      </div>
      {:else}
      <button>
        <Icon icon="check" />
        <span on:click={()=>dispatch('make-default', { address_id: address.address_id })}>Make Default</span>
      </button>
      {/if}

      <a href="/account/address/edit-address?address_id={address.address_id}">
        <Icon icon="editBox" />
        <span>Edit</span>
      </a>

    </div>

  </div>
  {/each}

</div>
{:else}
<Nothing>
  No address added yet
</Nothing>
{/if}

<style>
  .default {
    background-color: green;
    color: white;
  }
  .address {
    display: grid;
    gap: 5px;
  }
  .address h2 {
    font-size: 1.1rem;
    font-family: var(--serif);
    text-transform: capitalize;
  }
  .actions {
    display: flex;
    gap: 10px;
    margin-top: 10px;;
    /* border: 1px solid blue; */
  }
  .actions > * {
    border-radius: 5px;
    /* box-shadow: var(--shadow); */
    display: flex;
    gap: 5px;
    border: 1px solid var(--border);
    padding: 5px 10px;
  }
  .actions a, .actions button {
    color: blue;
  }
  .addresses {
    display: grid;
    gap: 20px;
    margin-bottom: 20px;
  }
  @media (min-width: 960px) {
    .addresses {
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }
  }
</style>