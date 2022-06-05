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
  import { goto } from "$app/navigation";
  import { page, session } from "$app/stores";
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import FieldGroup from "$lib/components/FieldGroup.svelte";
  import Input from "$lib/components/Input.svelte";
  import Layout from "$lib/components/Layout.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";
  import { extractYupErrors, registerSchema } from "$lib/others/schema.js";
  import { addToast } from "$lib/others/toast";
  import { axios } from "$lib/others/utils";
  import { debounce} from 'lodash-es'

  let user = {}, touched = false, errors = '';
  let emailError = ''
  let validationAllowed = true

  let next = $page.url.searchParams.get('next') || ''

  const validate = async () => {
    if (!validationAllowed) return
    try {
      await registerSchema.validate(user, { abortEarly: false })
      errors = ''
    } catch (error) {
      errors = extractYupErrors(error)
    }
  }

  const submit = async () => {
    if (!validationAllowed) return
    if (errors || emailError) { touched = true; return }
    await registerUser()
  }

  const registerUser = async () => {
    try {
      validationAllowed = false
      const response = await axios.post('/api/register', user)
      $session = {
        user_id: response.data.payload.user_id,
        name: response.data.payload.name
      }
      goto(next || '/')
      addToast({ type: 'info', message: 'You are registered and logged in', timeout: 8000})
    } catch (error) {
      validationAllowed = true
      addToast({ type: 'error', message: 'Unable to register'})
    }
  }

  const checkEmailAvailability = debounce(async () => {
    if (errors.email) return;
    const response = await axios.post('/api/is-email-available', { email: user.email || '' })
    if (response.data) {
      emailError = ''
    } else {
      emailError = 'Email already registered'
    }
  }, 2000);

  $: if (user) validate();
  $: if (user.email) checkEmailAvailability()
</script>

<Title title="Register New Account" />

<Layout>
  
  <div slot="main">

    <Subtitle icon="survey" subtitle="Enter Your Information" />

    <FieldGroup>
      <Input {touched} error={errors.name} bind:value={user.name} label="Name" />
      <Input {touched} type="email" error={errors.email || emailError} bind:value={user.email} label="Email" inputmode="email" />
      <Input {touched} error={errors.password} bind:value={user.password} label="Password" type="password" />
      <Input {touched} error={errors.repeatPassword} bind:value={user.repeatPassword} label="Retype Password" type="password" />
      <Input {touched} error={errors.city} bind:value={user.city} label="City" />
      <Input {touched} error={errors.address} bind:value={user.address} label="Address" />
    </FieldGroup>

    <Text>
      By registering, you agree to our <a href="/privacy-policies">privacy policies</a>
    </Text>

    <ButtonGroup>
      <Button icon="save" name="Register" on:click={submit} />
      <Button href="/user/login{next ? `?next=${next}` : ''}" icon="loginBox" name="Already a user? Login" type="general" />
    </ButtonGroup>

  </div>

  <div slot="related">

    <Subtitle icon="question" subtitle="Why Register?" />
    
    <Text>
      In order to save your data, including orders, wishlist, promos, notifications, etc. It is required to Sign-In/Register account
    </Text>

  </div>

</Layout>

<style>
  a {
    display: inline-block;
    color: blue;
    text-decoration: underline;
  }
</style>