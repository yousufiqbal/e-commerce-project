<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import Icon from "$lib/components/Icon.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Cart', href: '/cart' },
    { name: 'Order Confirmed', href: '/account/confirm' },
  ]

</script>

<!-- <Breadcrumb {crumbs} /> -->

<div class="title">Order Confirmed</div>

<ButtonGroup columns="1fr 2fr">
  <Button type="primary" icon="homeThree" href="/" name="Home" />
  <Button icon="fileCopy" name="Copy Order No." />
</ButtonGroup>

<div class="done">
  <div class="circle">
    <Icon icon="checkDouble" size="3rem" />
  </div>
</div>

<p>
  Your Order Number - <span style="font-weight: bold;">0224687</span>
</p>

<p>
  Your order has been confirmed. You will soon (in-sha-Allah) receive your order within 3-5 working days.
</p>

<p>
  In case of any delays or queries, you can contact our <a style="color: blue" href="/account/support">Customer Support</a>
</p>

<style>
  .title {
    font-family: var(--serif);
    font-size: 1.5rem;
    text-align: center;
    margin: 30px 0 40px 0;
  }
  .done {
    display: flex;
    justify-content: center;
    margin-bottom: 40px;
  }
  .circle {
    display: flex;
    color: green;
    border: 1px solid green;
    border-radius: 50%;
    padding: 10px;
    box-shadow: var(--shadow);
  }
  p {
    text-align: center;
    padding: 0 20px;
    margin-bottom: 20px;
    font-size: 1.1rem;
  }
</style>