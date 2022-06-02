<script>
  import { page } from "$app/stores";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Done from "$lib/components/Done.svelte";
</script>

<Done />

<div class="title">
  Order Confirmed
</div>

<p>
  Your Order Number - <span style="font-weight: bold;">{$page.url.searchParams.get('number')}</span>
</p>

<p>
  Your order has been confirmed. You will soon (in-sha-Allah) receive your order within 3-5 working days.
</p>

<p>
  In case of any delays or queries, you can contact our <a style="color: blue" href="/account/support">Customer Support</a>
</p>

<div class="mb40"></div>

<ButtonGroup columns="1fr 2fr">
  <Button type="primary" icon="homeThree" href="/" name="Home" />
  <Button type="general" icon="fileCopy" name="Copy Order No." />
</ButtonGroup>

<style>
  .title {
    font-family: var(--serif);
    font-size: 1.7rem;
    text-align: center;
    margin: 30px 0 40px 0;
  }

  p {
    text-align: center;
    padding: 0 20px;
    margin-bottom: 20px;
    font-size: 1.1rem;
  }
</style>