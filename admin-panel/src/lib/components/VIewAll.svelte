<script>
  import Icon from "./Icon.svelte";

  export let href
</script>

<a {href} class="view-all">
  <span>View All</span>
  <Icon icon="arrowRightS" />
</a>

<style>
  .view-all {
    display: flex;
    gap: 5px;
  }
  span {
    color: blue;
  }
</style>