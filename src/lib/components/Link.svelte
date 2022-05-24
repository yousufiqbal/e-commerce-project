<script>
import Icon from "./Icon.svelte";


  export let name, href, icon = 'arrowRightS'
</script>

<a {href} class="link">
  <span>{name}</span>
  <Icon size="1.3rem" {icon} />
</a>

<style>
  a {
    gap: 2px;
    display: flex;
    color: var(--primary);
  }
  span {
    padding-bottom: 2px;
    border-bottom: 1px dashed var(--primary);

  }
</style>