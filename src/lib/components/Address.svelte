<script>
  import SmallButton from "./SmallButton.svelte";
  import SmallButtonGroup from "./SmallButtonGroup.svelte";

  export let address = {}
</script>

<div class="address card">

  <h2>{address.label}</h2>
  <p>{address.address} - {address.city}</p>

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
    text-transform: capitalize;
    font-size: 1.1rem;
    font-family: var(--serif);
  }
  .address p {
    margin-bottom: 10px;
  }
</style>