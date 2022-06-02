<script>
  import { page } from "$app/stores";
  import Icon from "$lib/components/Icon.svelte";

  const Links = [ { name: '', icon: '', badge: '', href: '' } ]

  /** @type {Links} */
  export let links = []
</script>

<div class="menu">

  {#each links as link}
  <a class:active={$page.url.pathname == link.href} href={link.href} class="link">
    <Icon fill="var(--primary)" icon="{link.icon}" size="1.3rem" />
    <div class="name">{link.name}</div>
    {#if !link.badge}
    <Icon icon="arrowRightS" size="1.3rem" />
    {:else}
    <div class="badge">{link.badge} New</div>
    <Icon icon="arrowRightS" size="1.3rem" />
    {/if}
  </a>
  {/each}

</div>

<style>
  .active {
    background-color: rgb(243, 255, 240);
  }
  .menu {
    overflow: hidden;
    border-radius: 5px;
    border: 1px solid var(--border);
    margin-bottom: 30px;
  }
  .link {
    border-bottom: 1px solid var(--border);
    display: flex;
    gap: 15px;
    padding: 14px;
  }
  .link:last-child {
    border-bottom: none;
  }
  .name {
    flex: 1;
  }
  .badge {
    color: blue;
    /* border: 1px solid red; */
  }
  @media (min-width: 960px) {
    .link {
      padding: 12px 15px;
    }
  }
</style>