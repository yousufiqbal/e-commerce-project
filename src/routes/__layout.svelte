<script context="module">
  import { cartItems } from '$lib/others/cart'

  /** @type {import('@sveltejs/kit').Load} */
  export const load = async ({ fetch, session }) => {
    if (!session.user_id && !session.guest_id) {
      const response = await fetch('/api/make-guest')
      const payload = await response.json()
      session = payload
    }
    const response = await fetch('/api/carts')
    const cart = await response.json()
    cartItems.set(cart)
    return {}
  }
</script>
<script>
  import '$lib/styles/variables.css'
  import '$lib/styles/global.css'
  import Container from '$lib/components/Container.svelte'
  import BottomMenu from '$lib/components/BottomMenu.svelte'
  import NProgress from '$lib/components/NProgress.svelte';
  import Toasts from '$lib/components/Toasts.svelte';
</script>

<!-- Favicon fix -->
<svelte:head>
  <link rel="icon" href="/favicon.png" />
</svelte:head>

<Toasts />

<Container>
  <BottomMenu />
  <slot></slot>
</Container>

<div class="mb50"></div>

<NProgress />

