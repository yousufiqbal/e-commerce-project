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
    border: 1px solid red;
  }
  span {
    color: blue;
  }
</style>