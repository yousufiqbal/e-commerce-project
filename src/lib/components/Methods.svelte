<script>
  export let paymentMethod
</script>

<div class="methods card">
  <div class="method">
    <input bind:group={paymentMethod} type="radio" id="cod" name="cod" value="cod">
    <label for="cod">Cash On Delivery</label>
  </div>
  <div class="method">
    <input bind:group={paymentMethod} type="radio" id="card" name="card" value="card">
    <label for="card">Debit / Credit Card</label>
  </div>
</div>

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
</style>