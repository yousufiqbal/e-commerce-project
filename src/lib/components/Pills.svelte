<script>
  import { page } from "$app/stores";

  export let name = 'type'

  export let pills = [
    { name: 'Butter', url_name: 'butter' }
  ]
</script>

<div class="pills">

  {#each pills as pill}
  <a href="{$page.url.pathname}?{name}={pill.url_name}" class="pill">{pill.name}</a>
  {/each}

</div>

<style>
  .pills {
    border: 1px solid red;
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
  }
</style>