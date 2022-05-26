<script>
  let items = [
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 1, stock: 3 },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 2, stock: 5 },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 3, stock: 10 },
  ]

  let deliveryFee = 0, taxes = 0, promoDiscount = 0
  $: itemsAmount = items.map(item => item.counts * item.price).reduce((a, b) => +a + +b, 0)
  $: grandTotal = itemsAmount + deliveryFee + taxes + promoDiscount 
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
    <div>Rs. {promoDiscount}</div>
  </div>
  <div class="summary taxes">
    <div>Sales Tax</div>
    <div>Inclusive</div>
  </div>
  <div class="summary grand-total">
    <div>Total</div>
    <div>Rs. {grandTotal}</div>
  </div>
</div>

<style>
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
