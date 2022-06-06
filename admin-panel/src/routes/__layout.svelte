<script>
  import '$lib/styles/variables.css'
  import '$lib/styles/global.css'
  import Title from '$lib/components/Title.svelte';
  import Container from '$lib/components/Container.svelte';
import Topbar from '$lib/components/Topbar.svelte';
import Drawer from '$lib/components/Drawer.svelte';
import Subtitle from '$lib/components/Subtitle.svelte';
import ViewAll from '$lib/components/ViewAll.svelte';
</script>

<Topbar />
<Drawer />

<Container>
  <Title back="/account" title="Welcome" />
  <Subtitle icon="searchTwo" subtitle="New Products">
    <ViewAll />
  </Subtitle>
  <slot></slot>
</Container>
