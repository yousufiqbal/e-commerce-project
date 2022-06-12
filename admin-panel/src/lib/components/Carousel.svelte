<script>
  import { swipe } from 'svelte-gestures'
  import { fly } from "svelte/transition";

  export let basePath = ''
  export let images = []
  export let wide = false
  let current = 0
  let x = 0
  let status

  const change = index => {
    if (index == current) return
    if (index > current) {
      x = 20
      current = index
      return
    }
    if (index < current) {
      x = -20
      current = index
      return
    }
  }

  const alertEnd = () => {
    status.classList.add('end')
    setTimeout(() => {
      status.classList.remove('end')
    }, 2000)
  }

  const handleSwipe = e => {
    status.classList.remove('end')
    const direction = e.detail.direction
    if (direction == 'right' && current > 0) {
      x = -20
      current--
      return
    }
    if (direction == 'left' && current < images.length - 1) {
      x = 20
      current++
      return
    }
    alertEnd()
  }
</script>

{#if images.length != 0}
<div class:wide class="carousel {$$props.class}">

  <div class="placeholder">
    {#key current}
    <img  use:swipe={{ touchAction: 'pan-y', timeframe: 300, minSwipeDistance: 10 }} on:swipe={handleSwipe} class="main" in:fly={{ x, duration: 200 }} src="{basePath}{images[current].image}" alt="">
    {/key}
  </div>

  <div bind:this={status} class="status">{current + 1} / {images.length}</div>

  <div class="image-navigation">
    {#each images as image, index}
    <button on:mouseenter={()=>change(index)} ><img src="{basePath}{image.image}" alt=""></button>
    {/each}
  </div>

</div>
{/if}

<style>
  .wide {
    /* border: 1px solid red; */
    margin: -30px -20px;
    margin-bottom: 20px;
  }
  .wide img, .wide .placeholder {
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
  }
  img {
    width: 100%;
  }
  .carousel {
    position: relative;
    display: grid;
    justify-content: center;
    gap: 15px;
    /* outline: 1px solid red; */
  }
  .placeholder {
    background-color: gray;
    /* outline: 1px solid red; */
    min-height: 100px;
    display: flex;
    border-radius: 10px;
  }
  .status.end {
    opacity: 0.8;
    background-color: rgb(224, 0, 0);
    color: white;
  }
  .status {
    opacity: 0.5;
    font-size: 0.9rem;
    position: absolute;
    left: 10px; bottom: 10px;
    padding: 2px 7px ;
    border-radius: 10px;
    background-color: rgb(70, 70, 70);
    color: white;
    text-align: center;
    /* outline: 1px solid red; */
  }
  .main {
    border-radius: var(--radius);
  }
  .image-navigation {
    display: none;
  }
  @media (min-width: 1000px) {
    .status {
      display: none;
    }
    .image-navigation {
      display: flex;
      justify-content: center;
      gap: 15px;
    }
    button {
      display: flex;
      box-shadow: var(--shadow-small);
      width: 70px;
    }
  }
</style>