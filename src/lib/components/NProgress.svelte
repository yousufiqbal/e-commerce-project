<script>
  import NProgress from 'nprogress'
  import { navigating } from '$app/stores'
  import 'nprogress/nprogress.css'

  NProgress.configure({ showSpinner: false })
  $: $navigating ? NProgress.start() : NProgress.done()
</script>