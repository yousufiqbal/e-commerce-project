<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Return Policy', href: '/account/return-policy' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Return Policy" />

<Text>
  Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sint non possimus facilis quod veniam tempore minus, nemo beatae. Beatae nostrum provident quas excepturi dicta totam delectus eum culpa sapiente fugiat, adipisci nemo labore modi ab magnam possimus odio. Consectetur repudiandae ipsa earum optio id, quas saepe cum et, ad quisquam voluptatem corporis ab aliquid placeat eum, ipsum harum laborum repellendus.
</Text>

<Text>
  Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad reprehenderit, quibusdam praesentium accusamus corporis nostrum, earum voluptate ab atque, alias expedita! Obcaecati aliquid et vero repudiandae dolorum, maiores cum itaque?
</Text>
<Text>
  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat a error velit reprehenderit deserunt architecto iusto libero aliquam assumenda maxime!
</Text>