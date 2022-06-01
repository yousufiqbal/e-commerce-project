<script context="module">
  import { cartItemsStore } from '$lib/others/store'

  /** @type {import('@sveltejs/kit').Load} */
  export const load = async ({ fetch, session }) => {
    console.log(session)
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
  import Modal from '$lib/components/Modal.svelte';
  import Text from '$lib/components/Text.svelte';
  import Subtitle from '$lib/components/Subtitle.svelte';
  import Spaced from '$lib/components/Spaced.svelte';
  import SmallButton from '$lib/components/SmallButton.svelte';

  let show = false
</script>

{#if show}
<Modal on:close={()=>show=false}>

  <Subtitle icon="errorWarning" subtitle="Confirm" />

  <Text>
    Are You sure you want to remove this?
  </Text>

  <Spaced>
    <SmallButton icon="check" name="Yes" />
    <SmallButton icon="close" name="No" />
  </Spaced>

</Modal>
{/if}

<Container>
  <BottomMenu />
  <slot></slot>
</Container>

<div class="mb50"></div>

<NProgress />