<script>

import Icon from "./Icon.svelte";

</script>
<div class="addresses">
  
  <div class="address card">
    <h2>Office</h2>
    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Impedit, earum!</p>
    <div class="actions">
      <div class="default">
        <Icon icon="checkDouble" />
        <span>Default</span>
      </div>
      <a href="/address/edit-address">
        <Icon icon="editBox" />
        <span>Edit</span>
      </a>
    </div>
  </div>

  <div class="address card">
    <h2>Office</h2>
    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Impedit, earum!</p>
    <div class="actions">
      <button>
        <Icon icon="check" />
        <span>Make Default</span>
      </button>
      <a href="/address/edit-address">
        <Icon icon="editBox" />
        <span>Edit</span>
      </a>
    </div>
  </div>

</div>

<style>
  .default {
    background-color: green;
    color: white;
  }
  .addresses {
    display: grid;
    gap: 20px
  }
  .address {
    display: grid;
    gap: 5px;
  }
  .address h2 {
    font-size: 1.1rem;
    font-family: var(--serif);
  }
  .actions {
    display: flex;
    gap: 10px;
    margin-top: 10px;;
    /* border: 1px solid blue; */
  }
  .actions > * {
    border-radius: 5px;
    /* box-shadow: var(--shadow); */
    display: flex;
    gap: 5px;
    border: 1px solid var(--border);
    padding: 5px 10px;
  }
  .actions a, .actions button {
    color: blue;
  }
</style>