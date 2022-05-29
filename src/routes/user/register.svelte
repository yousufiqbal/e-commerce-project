<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import FieldGroup from "$lib/components/FieldGroup.svelte";
  import Input from "$lib/components/Input.svelte";
  import Layout from "$lib/components/Layout.svelte";
  import Subtitle from "$lib/components/Subtitle.svelte";
  import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Register New Account" />

<Layout>
  
  <div slot="main">

    <Subtitle icon="survey" subtitle="Enter Your Information" />

    <FieldGroup>
      <Input label="Name" />
      <Input label="Email" inputmode="email" />
      <Input label="Password" type="password" />
      <Input label="Retype Password" type="password" />
    </FieldGroup>

    <Text>
      By registering, you agree to our <a href="/privacy-policies">privacy policies</a>
    </Text>

    <ButtonGroup>
      <Button icon="save" name="Register" />
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


<!-- <FieldGroup>
  <Input label="Name" />
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
</Text> -->

<style>
  a {
    display: inline-block;
    color: blue;
    text-decoration: underline;
  }
</style>