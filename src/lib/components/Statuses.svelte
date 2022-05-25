<div class="statuses">

  <div class="status">
    <div class="detail">Confirmed</div>
    <div class="dated">May 1, 2022</div>
  </div>

  <div class="status">
    <div class="detail">Dispatched</div>
    <div class="dated">May 2, 2022</div>
  </div>

  <div class="status">
    <div class="detail">Received</div>
    <div class="dated">May 3, 2022</div>
  </div>

</div>

<style>
  .statuses {
    display: grid;
    margin-bottom: 20px;
    gap: 10px;
    /* border: 1px solid red;; */
  }
  .status {
    display: flex;
    padding: 0 2px 10px 2px;
    justify-content: space-between;
    border-bottom: 1px dashed var(--border);
  }
  .dated {
    color: green;
  }
</style>