<script>
  import Button from "./Button.svelte";
  import Spaced from "./Spaced.svelte";
  import Modal from "./Modal.svelte";
  import Subtitle from "./Subtitle.svelte";
  import Text from "./Text.svelte";
  import { createEventDispatcher } from "svelte";
  
  const dispatch = createEventDispatcher()
  let modal = { confirm: false }

  const handleClick = () => {
    modal.confirm = false
    dispatch('yes')
  }
</script>

<div class="wrapper">
  <button on:click={()=>modal.confirm=true} class="delete-this">
    Delete this?
  </button>
</div>

{#if modal.confirm}
<Modal on:close={()=>modal.confirm=false}>
  <Subtitle subtitle="Confirm Delete" />
  <Text>
    Are you sure you want to delete this?
  </Text>
  <Spaced>
    <Button shortcut="ctrl+enter" on:click={handleClick} icon="check" name="Yes" />
    <Button type="primary" icon="close" on:click={()=>modal.confirm=false} name="No" />
  </Spaced>
</Modal>
{/if}

<style>
  .delete-this {
    display: inline-flex;
    margin-top: 40px;
    color: red;
    padding-bottom: 3px;;
    border-bottom: 1px dashed rgb(255, 171, 171);
  }
  button:hover {
    color: blue;
  }
</style>