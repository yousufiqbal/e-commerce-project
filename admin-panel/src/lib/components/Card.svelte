<div class="card">
  <slot></slot>
</div>

<style global>
  .card {
    border: 1px solid var(--border);
    padding: 20px;
    box-shadow: var(--shadow);
    border-radius: 5px;
    background-color: #fff;
  }

  .card > :last-child {
    margin-bottom: 0 !important;
  }
</style>