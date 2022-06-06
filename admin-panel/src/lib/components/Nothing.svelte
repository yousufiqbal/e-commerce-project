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
  }
</style>