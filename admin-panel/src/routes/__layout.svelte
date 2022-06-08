<script>
  import '$lib/styles/variables.css'
  import '$lib/styles/global.css'
  import Container from '$lib/components/Container.svelte';
  import Topbar from '$lib/components/Topbar.svelte';
  import Drawer from '$lib/components/Drawer.svelte';
  import Menu from '$lib/components/Menu.svelte';
  import Toasts from '$lib/components/Toasts.svelte';
  import NProgress from '$lib/components/NProgress.svelte';
</script>

<NProgress />
<Toasts />

<div class="layout">
  <div class="left">
    <Drawer>
      <Menu />
    </Drawer>
  </div>
  <div class="right">
    <Topbar />

    <Container>
      <slot></slot>
    </Container>
  </div>
</div>

<style>
  .layout {
    display: grid;
  }
  .left {
    display: none;
  }
  @media (min-width: 800px) {
    .left {
      display: initial;
    }
    .layout {
      grid-template-columns: 200px 1fr;
    }    
  }
</style>