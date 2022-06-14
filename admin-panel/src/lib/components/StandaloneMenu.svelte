<script>
  import { page } from "$app/stores";
  import { setQuery } from "$lib/others/utils";
  import Icon from "./Icon.svelte";

  export let name = 'name'
  export let items = []

  $: current = $page.url.searchParams.get(name)
</script>

<div class="standalone-menu">
  {#each items as item}
  <a class:active={current==item.url_name} href="{setQuery({ [name]: item.url_name }, $page)}">
    <span>{item.name}</span>
    <Icon icon="arrowRightS" />
  </a>
  {/each}
</div>

<style>
  .standalone-menu {
    display: grid;
    border: 1px solid var(--border);
    border-radius: 5px;
    box-shadow: var(--shadow);
    overflow: hidden;
  }
  a:last-child {
    border-bottom: none;
  }
  a {
    display: flex;
    justify-content: space-between;
    padding: var(--padding);
    border-bottom: 1px solid var(--border);
    transition: color, background-color 300ms;
  }
  a:not(.active):hover {
    color: red;
  }
  .active {
    background-color: rgb(104, 104, 104);
    color: white;
  }
</style>