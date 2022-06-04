<script>
  import Input from "$lib/components/Input.svelte";
  import Title from "$lib/components/Title.svelte";
  import { cartItems } from "$lib/others/cart";

  let product = { product_id: 1, name: 'Nurpur Butter', url_name: 'nurpur-butter', price: 200}

  const add = () => {
    cartItems.addItem(product)
  }

  const remove = () => {
    cartItems.removeItem(product)
  }

  $: console.log($cartItems)
</script>

<Input bind:value={product.product_id} />
<div class="mb10"></div>
<button on:click={add}>Add to Cart</button>
<div></div>
<button on:click={remove}>Remove</button>
<Title title="Play" />
<div>{JSON.stringify($cartItems)}</div>


<!-- ['products.product_id', 'products.name',  'products.url_name', `${table}.quantity`, 'products.price'] -->