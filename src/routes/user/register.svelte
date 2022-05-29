<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import FieldGroup from "$lib/components/FieldGroup.svelte";
  import Input from "$lib/components/Input.svelte";
  import Layout from "$lib/components/Layout.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";
  import { extractYupErrors, registerSchema } from "$lib/database/schema.js";

  let user = {}, touched = false, errors = '';

  const validate = () => {
    try {
      registerSchema.validateSync(user, { abortEarly: false })
      errors = ''
    } catch (error) {
      errors = extractYupErrors(error)
      console.log(errors)
    }
  }

  const submit = async () => {
    if (errors) { touched = true; return }
    await registerUser()
  }

  const registerUser = async () => {

  }

  $: user && validate();
</script>

<Title title="Register New Account" />

<Layout>
  
  <div slot="main">

    <Subtitle icon="survey" subtitle="Enter Your Information" />

    <FieldGroup>
      <Input {touched} error={errors.name} bind:value={user.name} name="name" label="Name" />
      <Input {touched} error={errors.email} bind:value={user.email} name="email" label="Email" inputmode="email" />
      <Input {touched} error={errors.password} bind:value={user.password} name="password" label="Password" type="password" />
      <Input {touched} error={errors.repeatPassword} bind:value={user.repeatPassword} name="repeat-password" label="Retype Password" type="password" />
    </FieldGroup>

    <Text>
      By registering, you agree to our <a href="/privacy-policies">privacy policies</a>
    </Text>

    <ButtonGroup>
      <Button icon="save" name="Register" on:click={submit} />
      <Button href="/user/login" icon="loginBox" name="Already a user? Login" type="general" />
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