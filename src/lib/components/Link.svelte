<script>
  export let name, href
</script>

<a {href} class="link">{name}</a>

<style>
  a {
    padding-bottom: 2px;
    color: var(--primary);
    border-bottom: 1px dashed var(--primary);
  }
</style>