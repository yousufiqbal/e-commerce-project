<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Subtitle from "$lib/components/Subtitle.svelte";
import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'About', href: '/account/about' },
  ]
</script>

<Breadcrumb {crumbs} />
<Title back title="About" />

<Subtitle subtitle="Info" />

<Text>
  Fast.com is a properitorship company. We provide e-commerce (SAAS) Software As A Service, on custom requirements.
</Text>

<Subtitle subtitle="Office Location" />

<Text>
  G5, Nadi Par, Jhangru Bhangru, Karachi
</Text>

<Subtitle subtitle="Rights" />

<Text>
  Lorem ipsum dolor sit amet consectetur, adipisicing elit. Explicabo nemo doloremque veniam harum odio. Illo quo ipsa impedit magnam eveniet! &copy; { new Date().getFullYear()}
</Text>