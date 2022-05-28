<script>

import Icon from "./Icon.svelte";

</script>
<div class="nothing">
  <Icon icon="close" size="1.3rem" />
  <slot></slot>
</div>

<style>
  .nothing {
    display: flex;
    gap: 10px;
    margin-top: 40px;
    margin-bottom: 40px;
    padding-bottom: 10px;
    font-family: var(--serif);
    font-size: 1.1rem;
    border-bottom: 1px dashed red;
  }
</style>