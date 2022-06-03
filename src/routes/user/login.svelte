<script context="module">
  /** @type {import('@sveltejs/kit').Load} */
  export const load = async ({ session }) => {
    if (session.user_id) {
      return { status: 302, redirect: '/' }
    }
    return {}
  }
</script>
<script>
  import { dev } from "$app/env";
  import { goto } from "$app/navigation";
  import { page, session } from "$app/stores";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import FieldGroup from "$lib/components/FieldGroup.svelte";
import Icon from "$lib/components/Icon.svelte";
  import Input from "$lib/components/Input.svelte";
  import Layout from "$lib/components/Layout.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";
  import { extractYupErrors, loginSchema } from "$lib/others/schema.js";
  import { axios } from "$lib/others/utils";

  let user = {}, touched = false, errors = ''
  let validationAllowed = true
  let postLoginError = ''

  let next = $page.url.searchParams.get('next') || ''

  const validate = async () => {
    if (!validationAllowed) return
    try {
      await loginSchema.validate(user, { abortEarly: false })
      errors = ''
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (errors) { touched = true; return }
    await login()
  }

  const login = async () => {
    try {
      validationAllowed = false
      const response = await axios.post('/api/login', user)
      $session = {
        user_id: response.data.payload.user_id,
        name: response.data.payload.name
      }
      goto(next || '/')
    } catch (error) {
      postLoginError = error.data.message
      validationAllowed = true
    }
  }

  $: if (user) validate();
</script>

<Title title="Sign-In" />

<Layout>
  
  <div slot="main">

    <Subtitle icon="survey" subtitle="Enter Credentials" />

    <FieldGroup>
      <Input {touched} bind:value={user.email} error={errors.email} label="Email" inputmode="email" />
      <Input {touched} bind:value={user.password} error={errors.password} label="Password" type="password" />
    </FieldGroup>

    {#if postLoginError}
    <div class="login-error">
      <Icon icon="errorWarning" />
      <span>{postLoginError}</span>
    </div>
    {/if}
    
    <ButtonGroup>
      <Button icon="loginBox" name="Sign-In" on:click={submit} />
      <Button href="/user/register{next ? `?next=${next}` : ''}" type="general" icon="save" name="New user? Register Now" />
    </ButtonGroup>
    
    <a class="mb30" href="/user/forgot-password">
      Forgot Password?
    </a>
  </div>

  <div slot="related">

    <Subtitle icon="question" subtitle="Why Sign-In?" />
    
    <Text>
      In order to save your data, including orders, wishlist, promos, notifications, etc. It is required to Sign-In/Register account
    </Text>
    
  </div>

</Layout>


<style>
  .login-error {
    display: flex;
    margin-bottom: 20px;
    color: red;
    gap: 10px;
    align-items: center;
    /* border: 1px solid blue; */
  }
  a {
    display: flex;
    color: blue;
    text-decoration: underline;
  }
</style>