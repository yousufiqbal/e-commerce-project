<script>
import SmallButton from "./SmallButton.svelte";


import SmallButtonGroup from "./SmallButtonGroup.svelte";

</script>
<div class="address card">
  <h2>Office</h2>
  <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Numquam, quia.</p>
  <SmallButtonGroup>
    <SmallButton icon="editBox" name="Change Address" />
  </SmallButtonGroup>
</div>

<style>
  .address {
    display: grid;
    gap: 5px;
    margin-bottom: 20px;
  }
  .address h2 {
    font-size: 1.1rem;
    font-family: var(--serif);
  }
  .address p {
    margin-bottom: 10px;
  }
</style>