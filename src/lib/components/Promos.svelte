<div class="promos">

  <div class="promo card">

    <div class="title">
      <h2>BIG50</h2>
      <div class="status valid">Valid</div>
    </div>

    <div>
      <p>10% Off - Upto Rs. 50</p>
      <p>Validity Dec 18, 2022</p>
    </div>


  </div>
  
  <div class="promo card expired">

    <div class="title">
      <h2>BIG50</h2>
      <div class="status expired">Expired</div>
    </div>

    <div>
      <p>10% Off - Upto Rs. 50</p>
      <p>Validity Dec 18, 2022</p>
    </div>


  </div>

</div>

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
    opacity: 0.5;
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
    /* text-align: right; */
    font-family: var(--serif);
    color: green;
    /* font-weight: bold; */
  }
</style>