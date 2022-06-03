<script>
  import { beautifyDateTime } from "$lib/others/utils";
  import Nothing from "./Nothing.svelte";

  export let messages = []
</script>

{#if messages.length != 0}
<div class="messages">
  
  <h2>Date Remain..</h2>

  {#each messages as message (message.message_id)}
  <div class="message">
    <div class="date">{beautifyDateTime(message.created)}</div>
    <div class="body">{message.message}</div>
  </div>
  {/each}
  
</div>
{:else}
<Nothing>
  No messages
</Nothing>
{/if}

<style>
  h2 {
    font-family: var(--serif);
    font-size: 1.3rem;
    margin-bottom: 15px;
  }
  h2:not(:first-child) {
    margin: 15px 0;
  }
  .messages {
    display: grid;
    gap: 12px;
    /* border: 1px solid red; */
  }
  .message {
    padding-bottom: 12px;
    border-bottom: 1px dashed var(--border);
  }
  .message + .message:last-child {
    border-bottom: none !important;
  }
  .date {
    font-weight: bold;
  }
</style>