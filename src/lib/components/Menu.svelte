<script>
  import Badge from "./Badge.svelte";
import Icon from "./Icon.svelte";

  const Links = [
    { name: '', icon: '', badge: '', href: '' }
  ]

  /** @type {Links} */
  export let links = [
    { href: '/account/orders', name: 'Orders', icon: 'homeThree', badge: '' },
    { href: '/account/messages', name: 'Messages', icon: 'homeThree', badge: '5 New' },
    { href: '/account/search', name: 'Search', icon: 'searchTwo', badge: '' }
  ]
</script>

<div class="menu">

  {#each links as link}
  <a href={link.href} class="link">
    <Icon fill="var(--primary)" icon="{link.icon}" size="1.3rem" />
    <div class="name">{link.name}</div>
    {#if !link.badge}
    <Icon fill="var(--primary)" icon="arrowRightS" size="1.3rem" />
    {:else}
    <div class="badge">{link.badge}</div>
    {/if}
  </a>
  {/each}

</div>

<style>
  .menu {
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
    color: var(--primary);
    /* border: 1px solid red; */
  }
</style>