<script>
  import BillSummary from "$lib/components/BillSummary.svelte";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Cart from "$lib/components/Cart.svelte";
  import Message from "$lib/components/Message.svelte";
  import Statuses from "$lib/components/Statuses.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Title from "$lib/components/Title.svelte";
  import { beautifyDate } from "$lib/others/utils";
  import dayjs from "dayjs";

  export let order = {}, promo = {}, statuses = [], items = []

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Orders', href: '/account/orders' },
    { name: 'No. ' + order.order_id, href: '/account/orders/' + order.order_id },
  ]

</script>

<Breadcrumb {crumbs} />

<Title back title="Order # {order.order_id}" />

<Message pinned>
  You may receive your order by {beautifyDate(dayjs(order.created).add(7, 'days'))}. In case, date exceeds, feel free to contact <a href="/account/customer-support">Customer Support</a>.
</Message>

<Subtitle subtitle="Status" icon="listCheckTwo" />
<Statuses {statuses} />

<Subtitle subtitle="Items" icon="shoppingCart" />
<Cart locked {items} />

<Subtitle subtitle="Bill Summary" icon="bill" />
<BillSummary {promo} {items} />


