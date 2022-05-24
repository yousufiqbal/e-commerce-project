<script>
  import Icon from "./Icon.svelte";

  export let counts = 0, limit = null

  const increase = () => {
    counts++
  }

  const decrease = () => {
    counts--
  }
</script>

<div class="counter">
  <button on:click={decrease}><Icon size="1.3rem" icon="{counts == 1? 'deleteBin' : 'subtract'}" /></button>
  <div class="counts">{counts}</div>
  <button on:click={increase}><Icon size="1.3rem" icon="add" /></button>
</div>

<style>
  .counter {
    display: flex;
    align-items: center;
    border: 1px solid var(--border);
  }
  .counter .counts {
    min-width: 35px;
    font-weight: bold;
    flex: 1;
    text-align: center;
  }
  .counter button {
    padding: 7px;
    display: flex;
  }
  .counter button:first-child {
    border-right: 1px solid var(--border);
  }
  .counter button:last-child {
    border-left: 1px solid var(--border);
  }
</style>