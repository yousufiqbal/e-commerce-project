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

<Topbar />

<Drawer>
  <Menu />
</Drawer>

<Container>
  <slot></slot>
</Container>

<Toasts />