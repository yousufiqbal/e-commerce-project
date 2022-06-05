<script>
  import { beautifyDateTime } from "$lib/others/utils";
import dayjs from "dayjs";
import Icon from "./Icon.svelte";
  import Nothing from "./Nothing.svelte";
  import Subtitle from "./Subtitle.svelte";

  export let messages = []
</script>

{#if messages.length != 0}
<div class="messages">
  
  {#each messages as messageGroup, index}
  <div class="card">

    <Subtitle icon="calendar" subtitle={messageGroup.title} />
    
    <div class="message-group">
      {#each messages[index].messages as message}
      <div class="message">
        <div class="time">
          {dayjs(message.created).format('hh:mm a')}
        </div>
        <div class="body">{message.message}</div>
      </div>
      {/each}
    </div>
    
  </div>
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
    gap: 20px;
    /* border: 1px solid blue; */
  }
  .message-group {
    display: grid;
    gap: 15px;
  }
  .message:last-child {
    border-bottom: none;
  }
  .message {
    /* border: 1px solid red; */
    display: grid;
    gap: 5px;
  }
  .time {
    display: flex;
    gap: 5px;
    font-family: var(--serif);
  }
</style>
