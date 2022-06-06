<script>
  import { showDrawer } from "$lib/stores/misc";
  import Icon from "./Icon.svelte";

  const toggleDrawer = () => {
    $showDrawer = !$showDrawer
  }
</script>

<div class="topbar">

  <div class="logo">
    Fast Admin
  </div>

  <div class="buttons">
    <a href="/admin"><Icon icon="userThree" size="1.3rem" /></a>
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
    gap: 10px;
  }
  .buttons > button, .buttons > a {
    display: flex;
    padding: 12px 7px;
    /* border: 1px solid green; */
  }
  .logo {
    font-family: var(--serif);
  }
</style>