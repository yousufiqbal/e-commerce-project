<div class="options">
  <slot></slot>
</div>

<style global>
  .options {
    /* border: 1px solid red; */
    display: grid;
    gap: 20px;
    max-height: 500px;
    overflow-y: auto;
    padding-right: 10px;
  }
  .options button {
    border: 1px solid var(--border);
    padding: var(--padding);
    color: blue;
    border-radius: 4px;
  }
  .options button:hover {
    color: red;
  }
</style>