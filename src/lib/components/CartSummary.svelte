<!-- Total, Items, Rs. Tax -->

<div class="cart-summary">

  <div class="left">
    <div>Total</div>
    <div>4 Items</div>
  </div>

  <div class="right">
    <div>Rs. 2250</div>
    <div>All Taxes Included</div>
  </div>

</div>

<style>
  .cart-summary {
    display: flex;
    justify-content: space-between;
    border: 1px solid var(--border);
    border-radius: 5px;
    box-shadow: var(--shadow);
    padding: 10px;
    margin-bottom: 20px;
  }
  .left, .right {
    color: gray;
    display: grid;
  }
  .left > :first-child {
    color: black;
    font-size: 1.3rem;
    font-weight: bold;
  }
  .right > :first-child {
    font-size: 1.3rem;
    font-weight: bold;
    color: green;
    text-align: right;  
  }
</style>