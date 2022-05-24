<script>
  import '$lib/styles/variables.css'
  import '$lib/styles/global.css'
  import Container from '$lib/components/Container.svelte'
  import BottomMenu from '$lib/components/BottomMenu.svelte'
</script>

<Container>
  <slot></slot>
</Container>

<div class="mb50"></div>

<BottomMenu />