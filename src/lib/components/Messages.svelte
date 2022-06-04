<script>
  import { beautifyDateTime } from "$lib/others/utils";
  import Nothing from "./Nothing.svelte";
  import Subtitle from "./Subtitle.svelte";

  export let messages = []
</script>

{#if messages.length != 0}
<div class="messages">
  
  {#each messages as messageGroup, index}
  <Subtitle icon="calendar" subtitle={messageGroup.title} />

    {#each messages[index].messages as message}
    <div class="message">
      <div class="date">{beautifyDateTime(message.created)}</div>
      <div class="body">{message.message}</div>
    </div>
    {/each}
    <div class="mb10"></div>

  {/each}
  
</div>

{:else}
<Nothing>
  No messages
</Nothing>
{/if}

<style>
  .messages {
    display: grid;
    gap: 12px;
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