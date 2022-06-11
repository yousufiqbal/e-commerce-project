<div class="links">
  <slot></slot>
</div>

<style global>
  .links {
    max-height: 500px;
    overflow-y: auto;
    padding-right: 10px;
    display: grid;
    gap: 15px;
  }
  .links > * {
    padding: var(--padding);
    border: 1px solid var(--border);
    border-radius: 5px;
  }
  .links > *:hover {
    color: red;
  }
</style>