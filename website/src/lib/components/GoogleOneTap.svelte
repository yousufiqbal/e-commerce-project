<script>
  import { onMount } from "svelte";
  import { axios } from '$lib/others/utils'
  import { session } from "$app/stores";

  const handleMe = async data => {
    try {
      const response = await axios.post('/api/login', data)
      $session.user = response.data.name
    } catch (error) {
      alert('Unable to sign-in. We are sorry.')
    }
  }

  onMount(() => {
    if ($session.user) return
    google.accounts.id.initialize({
      client_id: '584500082197-d97vsbhiakbk3b6pt18l8vqodel2svlf.apps.googleusercontent.com',
      callback: handleMe
    })
    google.accounts.id.prompt();
  })
</script>