<script context="module">
  import { cartItemsStore } from '$lib/others/store'


  /** @type {import('@sveltejs/kit').Load} */
  export const load = async ({ fetch, session }) => {
    if (!session.user_id && !session.guest_id) {
      const response = await fetch('/api/make-guest')
      const payload = await response.json()
      session = payload
    }
    const response = await fetch('/api/carts')
    const cartItems = await response.json()
    cartItemsStore.set(cartItems)
    return {}
  }
</script>
<script>
  import '$lib/styles/variables.css'
  import '$lib/styles/global.css'
  import Container from '$lib/components/Container.svelte'
  import BottomMenu from '$lib/components/BottomMenu.svelte'
  import NProgress from '$lib/components/NProgress.svelte';
  import { addToast } from '$lib/others/toast';
  import Toasts from '$lib/components/Toasts.svelte';

  let input = ''
</script>

<Toasts />


<Container>
  <input bind:value={input} type="text">
  <button on:click={()=>addToast({ message: input })}>Add Toast</button>
  <BottomMenu />
  <slot></slot>
</Container>

<div class="mb50"></div>

<NProgress />

