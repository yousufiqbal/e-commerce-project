<script>
  import Icon from "./Icon.svelte"

  export let pinned = false
</script>

<div class="message info">
  <div>
    <slot></slot>
  </div>
  {#if !pinned}
  <button>
    <Icon size="1.3rem" icon="close" fill="var(--primary)" />
  </button>
  {/if}
</div>

<style>
  .message {
    display: flex;
    align-items: center;
    gap: 10px;
    /* border-radius: 5px; */
    padding: 10px 15px;
    border: 1px dashed var(--border);
    border-radius: 5px;
    margin-bottom: 20px;
  }
  button {
    border-radius: 5px;
    padding: 4px;
    display: flex;
    border: 1px solid var(--border);
  }
  /* .message a {
    color: blue;
  } */
  .info {
    background-color: rgb(255, 254, 240);
  }
</style>