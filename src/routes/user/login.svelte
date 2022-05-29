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

<Title title="Sign-In" />

<Layout>
  
  <div slot="main">

    <Subtitle icon="survey" subtitle="Enter Credentials" />

    <FieldGroup>
      <Input label="Email" inputmode="email" />
      <Input label="Password" type="password" />
    </FieldGroup>
    
    <ButtonGroup>
      <Button icon="loginBox" name="Sign-In" />
      <Button href="/user/register" type="general" icon="save" name="New user? Register Now" />
    </ButtonGroup>
    
    <a class="mb30" href="/user/forgot-password">Forgot Password?</a>
  </div>

  <div slot="related">

    <Subtitle icon="question" subtitle="Why Sign-In?" />
    
    <Text>
      In order to save your data, including orders, wishlist, promos, notifications, etc. It is required to Sign-In/Register account
    </Text>
    
  </div>

</Layout>


<style>
  a {
    display: flex;
    color: blue;
    text-decoration: underline;
  }
</style>