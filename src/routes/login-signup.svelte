<script>
import { page } from "$app/stores";

import Button from "$lib/components/Button.svelte";

import ButtonGroup from "$lib/components/ButtonGroup.svelte";
import FieldGroup from "$lib/components/FieldGroup.svelte";

import Input from "$lib/components/Input.svelte";

  import QueryTabs from "$lib/components/QueryTabs.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";
</script>

<Text>
  In order to save your data, including orders, wishlist, promos, notifications, etc. It is required to Sign-In / Register account
</Text>

<Title title="Login / Register" />

<QueryTabs items={[{name: 'Login', url_name: 'login'}, {name: 'Register', url_name: 'register'}]} />

{#if $page.url.searchParams.get('tab') != 'register'}
<FieldGroup>
  <Input label="Email" inputmode="email" />
  <Input label="Password" type="password" />
</FieldGroup>


<ButtonGroup columns="1fr 2fr">
  <Button icon="loginBox" name="Login" />
  <Button type="general" icon="lockUnlock" name="Forgot Password" />
</ButtonGroup>

<a class="mb30" href="?tab=register">New user? Register</a>

{:else}
<FieldGroup>
  <Input label="Name" />
  <Input label="Mobile No." inputmode="numeric" />
  <Input label="Email" inputmode="email" />
  <Input label="Password" type="password" />
  <Input label="Retype Password" type="password" />
</FieldGroup>


<ButtonGroup>
  <Button icon="save" name="Register" />
</ButtonGroup>

<a class="mb30" href="?tab=login">Already a user? Login</a>
<Text>
  By registering, you agree to our <a href="/privacy-policies">privacy policies</a>.
</Text>
{/if}

<style>
  a {
    /* display: flex; */
    color: blue;
  }
</style>