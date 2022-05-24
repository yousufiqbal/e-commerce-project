<script>
  import Icon from "$lib/components/Icon.svelte";
  import { swipe } from 'svelte-gestures';
  import { fly } from "svelte/transition";

  let x

  const handleSwipe = e => {
    let direction = e.detail.direction;
    if (direction == 'left') { // forward
      x = 20
      if (current < images.length - 1) { current++ }
      else { current = 0 }
    }
    if (direction == 'right') { // backward
      x = -20
      if (current > 0) { current-- } 
      else { current = images.length - 1 }
    }
  }

  export let images = [ '/cat1.jpg', '/cat2.jpg', '/cat3.jpg', '/cat4.jpg' ];
  let current = 0
</script>

<div class="carousel">

  <div class="placeholder">
    {#key current}
    <img in:fly={{ x, duration: 200 }} use:swipe={{ timeframe: 300, minSwipeDistance: 30 }} on:swipe={handleSwipe} src="{images[current]}" alt="">
    {/key}
  </div>

  <div class="dots">
    {#each new Array(images.length) as v, index}
    <button on:click={()=>current=index}>
      <Icon size="0.7rem" fill="gray" icon="{index == current ? 'filledCircle' : 'emptyCircle'}" />
    </button>
    {/each}
  </div>

</div>

<style>
  .carousel {
    display: grid;
    gap: 10px;
    margin-bottom: 20px;
    /* border: 1px solid red; */
  }
  img {
    min-height: 150px;
    border-radius: 5px;
    border: 1px solid var(--border);
    box-shadow: 0 0 10px 0 lightgray;
  }
  .dots {
    display: flex;
    gap: 8px;
    justify-content: center;
    /* border: 1px solid blue; */
  }
  .dots button {
    display: flex;
  }
</style>