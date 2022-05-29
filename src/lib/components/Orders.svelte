<script>
import SmallButton from "./SmallButton.svelte";
import SmallButtonGroup from "./SmallButtonGroup.svelte";

</script>
<div class="orders">

  <div class="order card">
    <h2>Order # 546546</h2>
    <div style="margin-bottom: 10px;">
      <p class="dated">Placed On: May 20, 2022</p>
      <p class="dated">Expected On: May 25 - May 30, 2022</p>
    </div>
    <SmallButtonGroup>
      <SmallButton href="/account/orders/546546" icon="eye" name="Show Details" />
    </SmallButtonGroup>
  </div>

  <div class="order card">
    <h2>Order # 546546</h2>
    <div style="margin-bottom: 10px;">
      <p class="dated">Placed On: May 20, 2022</p>
      <p class="dated">Expected On: May 25 - May 30, 2022</p>
    </div>
    <SmallButtonGroup>
      <SmallButton href="/account/orders/546546" icon="eye" name="Show Details" />
    </SmallButtonGroup>
  </div>

</div>

<style>
  .order {
    display: grid;
    gap: 10px;
  }
  h2 {
    font-size: 1.2rem;
    font-family: var(--serif);
  }
  .orders {
    display: grid;
  }
  @media (min-width: 960px) {
    .orders {
      gap: 20px;
      grid-template-columns: 1fr 1fr;
    }
  }
</style>