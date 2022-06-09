<script>
  import NProgress from 'nprogress'
  import { navigating } from '$app/stores'
  import 'nprogress/nprogress.css'


  NProgress.configure({ showSpinner: false, minimum: 0.16, easing: 'ease' })
  $: $navigating ? NProgress.start() : NProgress.done()
  // $: $loading ? NProgress.start() : NProgress.done()
</script>