<script>
  import { page } from "$app/stores";
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Sign-In', href: '/account/sign-in' },
  ]

  let next = $page.url.searchParams.get('next') || null
</script>

<Breadcrumb {crumbs} />

<Title back title="Sign-In" />

<ButtonGroup>
  <Button name="Sign-In" href="{next || '/'}" icon="loginBox" />
</ButtonGroup>