<script>
  export let items = []
  export let promo = { max_discount: 0 }

  let deliveryFee = 0, taxes = 0
  $: itemsAmount = items.map(item => item.quantity * item.price).reduce((a, b) => +a + +b, 0)
  $: grandTotal = (itemsAmount + deliveryFee + taxes) - promo.max_discount 
</script>

<div class="bill-summary card">
  <div class="summary items-amount">
    <div>Items Amount</div>
    <div>Rs. {itemsAmount}</div>
  </div>
  <div class="summary delivery-fee">
    <div>Delivery Fee</div>
    <div>Rs. {deliveryFee}</div>
  </div>
  <div class="summary promo-discount">
    <div>Promo Discount</div>
    <div><strong>-</strong> Rs. {promo.max_discount}</div>
  </div>
  <div class="summary taxes">
    <div>Sales Tax (13%)</div>
    <div>Inclusive</div>
  </div>
  <div class="summary grand-total">
    <div>Total</div>
    <div>Rs. {grandTotal}</div>
  </div>
</div>

<style>
  strong {
    color:  red;
    font-weight: bold;
  }
  .bill-summary {
    display: grid;
    gap: 8px;
    /* border: 1px solid red; */
    margin-bottom: 30px;
  }
  .summary {
    display: flex;
    justify-content: space-between;
  }
  .grand-total {
    margin-top: 2px;
    padding-top: 8px;
    border-top: 1px dashed var(--border);
  }
  .grand-total > :first-child {
    font-weight: bold;
    font-size: 1.2rem;
  }
  .grand-total > :last-child {
    font-size: 1.2rem;
    font-weight: bold;
    color: green;
  }
</style>
