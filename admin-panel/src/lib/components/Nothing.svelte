<script>
  import Icon from "./Icon.svelte";
</script>

<div class="nothing">
  <Icon icon="close" />
  <slot></slot>
</div>

<style>
  .nothing {
    display: flex;
    gap: 10px;
    padding-bottom: 10px;
    border-bottom: 1px dashed red;
    margin-bottom: var(--margin-bottom, 20px);
    max-width: 500px;
  }
</style>