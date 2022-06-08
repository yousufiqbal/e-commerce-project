<form class="field-group" on:submit|preventDefault>
  <slot></slot>
</form>

<style>
  .field-group {
    display: grid;
    margin-bottom: 40px;
    gap: 20px;
  }
  @media (min-width: 960px) {
    .field-group {
      max-width: 600px;
      grid-template-columns: 1fr 1fr;
    }
  }
</style>