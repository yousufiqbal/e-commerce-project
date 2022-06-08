<script>
  import { onMount } from "svelte";

  onMount(() => {
    google.accounts.id.initialize({
      ux_mode: 'redirect',
      client_id: "584500082197-d97vsbhiakbk3b6pt18l8vqodel2svlf.apps.googleusercontent.com",
    });
    google.accounts.id.renderButton(
      document.getElementById("google-login"),
      { theme: "outline", size: "large" }  // customization attributes
    );
    // google.accounts.id.prompt(); 
  })
</script> 