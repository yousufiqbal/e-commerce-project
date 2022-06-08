<script>
  import { dark, showDrawer } from "$lib/stores/misc";
  import Icon from "./Icon.svelte";

  const toggleDrawer = () => {
    $showDrawer = !$showDrawer
  }

  const toggleTheme = () => {
    $dark = !$dark
  }
</script>

<div class="topbar">

  <div class="logo">
    <svg width="1.5em" height="1.5em" viewBox="0 0 32 32"><path fill="currentColor" d="m5.063 6l-.25.656L1.313 16H0v2h1v2c0 3.297 2.703 6 6 6h2c3.297 0 6-2.703 6-6v-3c0-.566.434-1 1-1c.566 0 1 .434 1 1v3c0 3.297 2.703 6 6 6h2c3.297 0 6-2.703 6-6v-2h1v-2h-1.313l-3.5-9.344l-.25-.656H25l-.281.375l-2.5 3l1.562 1.25l1.907-2.313L28.563 16h-9.75c-.418-1.156-1.52-2-2.813-2c-1.293 0-2.395.844-2.813 2h-9.75l2.876-7.688l1.906 2.313l1.562-1.25l-2.5-3L7 6zM3 18h10v2c0 2.203-1.797 4-4 4H7c-2.203 0-4-1.797-4-4zm16 0h10v2c0 2.203-1.797 4-4 4h-2c-2.203 0-4-1.797-4-4z"></path></svg>
  </div>

  <div class="buttons">
    <a href="/admin"><Icon icon="admin" size="1.3rem" /></a>
    <button on:click={toggleTheme}><Icon icon="{$dark ? 'sun' : 'moon'}" size="1.3rem" /></button>
    <button on:click={toggleDrawer}><Icon fill="var(--primary)" icon="{$showDrawer ? "close" : "menuThree"}" size="1.3rem" /></button>
  </div>

</div>

<style>
  .topbar {
    border-bottom: 1px solid var(--border);
    box-shadow: var(--shadow);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0px 20px;
  }
  .buttons {
    /* border: 1px solid blue; */
    display: flex;
    gap: 5px;
  }
  .buttons > button, .buttons > a {
    display: flex;
    padding: 12px 7px;
    /* border: 1px solid green; */
  }
  .logo {
    display: flex;
    align-items: center;
    color: var(--primary);
    font-family: var(--serif);
  }
</style>