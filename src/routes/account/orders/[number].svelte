<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Cart from "$lib/components/Cart.svelte";
import CartSummary from "$lib/components/CartSummary.svelte";
import Message from "$lib/components/Message.svelte";
import Statuses from "$lib/components/Statuses.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Orders', href: '/account/orders' },
    { name: 'No. ' + $page.params.number, href: '/account/orders/' + $page.params.number },
  ]

  const labels = [
    { name: 'Home', url_name: 'home' },
    { name: 'Company', url_name: 'company' },
    { name: 'Office', url_name: 'office' },
  ]

  let items = [
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 1, stock: 3 },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 2, stock: 5 },
    { name: 'Head & Shoulders 250ML', url_name: 'head-and-shoulders-250ml', price: 250, counts: 3, stock: 10 },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Order # {$page.params.number}" />

<Message pinned>
  You may receive your order by May 26, 2022. In case, date exceeds, feel free to contact <a href="/account/customer-support">Customer Support</a>.
</Message>

<Subtitle subtitle="Status" />

<Statuses />

<Subtitle subtitle="Items" />

<Cart locked {items} />
<CartSummary {items} />


