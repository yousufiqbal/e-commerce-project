<script>
  import Addresses from "$lib/components/Addresses.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  export let method 

  const crumbs = [
    { name: 'Cart', href: '/cart' },
    { name: 'Checkout', href: '/cart/checkout' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Checkout" />

<Subtitle subtitle="Address" />
<Addresses />

<Subtitle subtitle="Payment Method" />

<div class="methods">
  <div class="method">
    <input bind:group={method} type="radio" id="cod" name="cod" value="cod">
    <label for="cod">Cash On Delivery</label>
  </div>
  <div class="method">
    <input bind:group={method} type="radio" id="card" name="card" value="card">
    <label for="card">Debit / Credit Card</label>
  </div>
</div>

<Subtitle subtitle="Promo Code" />

<div class="promo-input">
  <input type="text">
  <button>Apply</button>
</div>

<Subtitle subtitle="Bill Summary" />

<!-- <ButtonGroup>
  <Button name="Confirm Order" href="/cart/confirm" icon="checkDouble" />
</ButtonGroup> -->

<style>
  .methods {
    display: grid;
    justify-items: start;
    gap: 15px;
    margin-bottom: 20px;
    /* border: 1px solid red; */
  }
  .method {
    display: flex;
    gap: 15px;
    align-items: center;
    /* border: 1px solid blue; */
  }
  .promo-input {
    display: flex;
    border: 1px solid var(--border);
    border-radius: 5px;
    overflow: hidden;
    box-shadow: var(--shadow);
    margin-bottom: 20px;
  }
  input {
    flex: 1;
    padding: var(--padding-extra);
    /* border: 1px solid blue; */
  }
  button {
    padding: 12px 20px;
    /* border: 1px solid green; */
    color: white;
    background-color: var(--secondary);
  }
</style>