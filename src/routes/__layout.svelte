<script>
  import '$lib/styles/variables.css'
  import '$lib/styles/global.css'
  import Container from '$lib/components/Container.svelte'
  import BottomMenu from '$lib/components/BottomMenu.svelte'
  // import { page } from '$app/stores';
  import NProgress from '$lib/components/NProgress.svelte';

  // const paths = ['/cart/checkout']
</script>

<Container>
  <slot></slot>
</Container>

<div class="mb50"></div>

<!-- {#if !paths.includes($page.url.pathname)} -->
<BottomMenu />
<!-- {/if} -->

<NProgress />