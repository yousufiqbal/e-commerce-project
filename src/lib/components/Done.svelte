<script>
  import Icon from "./Icon.svelte";
</script>

<div class="done">
  <div class="circle">
    <Icon icon="checkDouble" size="3rem" />
  </div>
</div>

<style>
  .done {
    display: flex;
    justify-content: center;
    margin: 30px;
  }
  .circle {
    display: flex;
    color: green;
    border: 1px solid green;
    border-radius: 50%;
    padding: 10px;
    box-shadow: var(--shadow);
  }
</style>