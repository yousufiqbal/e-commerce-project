<script>
  import { createEventDispatcher } from "svelte";
  import { fly } from "svelte/transition";
  import Button from "./Button.svelte";
  import ButtonGroup from "./ButtonGroup.svelte";
  import Card from "./Card.svelte";
  import Subtitle from "./Subtitle.svelte";
  import Text from "./Text.svelte";

  const dispatch = createEventDispatcher()

  const handleEscapeKey = e => {
    if (e.key == 'Escape') dispatch('close')
  }
</script>

<div class="wrapper">
  <div transition:fly|local={{y: -20, duration: 150}} class="modal">

    <Card>
      <Subtitle subtitle="New Products" />
      <Text>
        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eum qui alias unde natus veritatis! Exercitationem maxime consectetur excepturi ipsam quam!
      </Text>
      <ButtonGroup>
        <Button icon="save" name="Save" type="primary" />
        <Button icon="close" name="Discard" />
      </ButtonGroup>
      <slot></slot>
    </Card>


  </div>
</div>

<svelte:window on:keydown={handleEscapeKey} />

<style>
  .wrapper {
    display: grid;
    place-items: center;
    position: fixed;
    top: 0; left: 0; right: 0; bottom: 0;
    background-color: rgba(243, 243, 243, 0.7);
    border: 1px solid red;
    padding: 20px;
  }
  .modal {
    max-width: 500px;
  }
</style>