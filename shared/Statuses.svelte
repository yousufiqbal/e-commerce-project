<script>
import { beautifyDateTime } from "$lib/others/utils";


  export let statuses = []
</script>

{#if statuses.length != 0}
<div class="statuses">
  
  <div class="status">
    <div class="detail">Confirmed</div>
    <div class="dated">{beautifyDateTime(statuses.filter(status => status.status == 'confirmed')[0]?.created ) || 'Pending'}</div>
  </div>
  
  <div class="status">
    <div class="detail">Dispatched</div>
    <div class="dated">{beautifyDateTime(statuses.filter(status => status.status == 'dispatched')[0]?.created ) || 'Pending'}</div>
  </div>

  <div class="status">
    <div class="detail">Received</div>
    <div class="dated">{beautifyDateTime(statuses.filter(status => status.status == 'received')[0]?.created ) || 'Pending'}</div>
  </div>
  
</div>
{/if}

<style>
  .statuses {
    display: grid;
    margin-bottom: 20px;
    gap: 10px;
    /* border: 1px solid red;; */
  }
  .status {
    display: flex;
    padding: 0 2px 10px 2px;
    justify-content: space-between;
    border-bottom: 1px dashed var(--border);
  }
  .dated {
    color: green;
  }
</style>