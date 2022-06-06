<script>
  import '$lib/styles/variables.css'
  import '$lib/styles/global.css'
  import Title from '$lib/components/Title.svelte';
  import Container from '$lib/components/Container.svelte';
import Topbar from '$lib/components/Topbar.svelte';
import Drawer from '$lib/components/Drawer.svelte';
import Subtitle from '$lib/components/Subtitle.svelte';
import ViewAll from '$lib/components/ViewAll.svelte';
import Text from '$lib/components/Text.svelte';
import QueryTabs from '$lib/components/QueryTabs.svelte';
import ButtonGroup from '$lib/components/ButtonGroup.svelte';
import Button from '$lib/components/Button.svelte';
import Card from '$lib/components/Card.svelte';
import Modal from '$lib/components/Modal.svelte';
import Menu from '$lib/components/Menu.svelte';

  export let show = false
</script>

<Topbar />
<Drawer>
  <Menu />
</Drawer>

<Container>
  <QueryTabs />
  <Title back="/account" title="Welcome" />

  <ButtonGroup>
    <Button on:click={()=>show=!show} icon="save" name="Toggle Modal" type="primary" />
  </ButtonGroup>

  {#if show}
  <Modal on:close={()=>show=false} />
  {/if}

  <slot></slot>
</Container>
